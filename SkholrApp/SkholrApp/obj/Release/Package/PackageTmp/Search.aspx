<%@ Page Title="Skholr" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SkholrApp.Search" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-6 d-flex align-items-center" style="margin-left: auto; margin-right: auto;">
            <div class="col-5 d-flex align-items-center" style="margin-left: auto; margin-right: auto;">
                <img src="http://cdn.skholr.com/Skholr.png" alt="Skholr" style="width: 100%"W>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-6 d-flex align-items-center" style="margin-left: auto; margin-right: auto;">
            <input type="text" id="esQuery" name="esSearch" value="" style="width: 100%;" placeholder="enter text to search " />
        </div>
    </div>
    <div class="row">
        <div id="cardContainer" class="col-10">
        </div>
    </div>




    <script>    
        $(document).ready(function () {
            $("#esQuery").keyup(function () {
                var q = $('#esQuery').val();

                if (q.length > 5) {
                    $.ajax({
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        data: { query: JSON.stringify(q) },
                        url: "Search.aspx/ESQuery",
                        success: function (data) {
                            var url = "http://cdn.skholr.com/"
                            $('#cardContainer').empty();
                            $.each(data.d, function (i, d) {
                                if (d.indexOf("/") >= 0)
                                    var filename = d.split('/')[1];
                                else
                                    var filename = d;

                                filename = filename.replace(".txt", ".pdf");
                                var displayFN = filename.replace(/\+/g, ' ');
                                $('#cardContainer').append("<div class='card'><div class='card-header'>" +
                                    displayFN + ': <a href="' + url + filename +
                                    '"> Link</a>' +
                                    '</div ></div>');
                            });
                        },
                        error: function (data) {
                            debugger;
                        }
                    });
                }
                else {
                    $('#cardContainer').empty();
                }
            });
        });
    </script>
</asp:Content>

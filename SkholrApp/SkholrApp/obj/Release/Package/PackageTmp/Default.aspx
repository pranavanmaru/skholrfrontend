<%@ Page Title="Skholr" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SkholrApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Skholr</h1>
        <p class="lead">Skholr is a document diretctory and a free web framework for building great research papers using Big Data Analytics and Elastic Search Recommendations.</p>
        <p><a href="http://www.skholr.com/About.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-6">
            <table border="0">
                <tr>
                    <td>
                        <label for="Topic">Research Area</label>

                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTopic" runat="server">
                            <asp:ListItem Text="<Select Topic>" Value="0" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="txtKeywords">Keywords</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKeywords" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Click browse button to upload a PDF document:
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="UploadButton"
                            Text="Upload PDF"
                            OnClick="UploadButton_Click"
                            runat="server"></asp:Button>
                    </td>
                    <td>
                        <asp:Label ID="UploadStatusLabel" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>

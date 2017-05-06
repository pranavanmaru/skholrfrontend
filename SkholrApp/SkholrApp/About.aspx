<%@ Page Title="Skholr" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SkholrApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.js"></script>
    <h3>Architecture</h3>
    <div class="row">
        
        <div class="col-md-12 align-items-center" style="text-align: center;">
            
            <img src="http://cdn.skholr.com/architecture.png" class="img-fluid" style="height: 52vh;">
        </div>         
    </div>
    <h3>Team</h3>
    <div class="row">
        <div class="offset-md-2 col-md-10">            
            <div class="row align-items-center">
                <a href="http://cdn.skholr.com/thumb_pranavan.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                    <img src="http://cdn.skholr.com/thumb_pranavan.jpg" class="img-fluid">
                </a>
                <a href="https://www.linkedin.com/in/himanshu-agrawal/" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                    <img src="http://cdn.skholr.com/thumb_himanshu.jpg" class="img-fluid">
                </a>
                <a href="https://www.linkedin.com/in/nehaselokar/" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                    <img src="http://cdn.skholr.com/thumb_neha.jpg" class="img-fluid">
                </a>
                <a href="https://www.linkedin.com/in/sankalpjain92/" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                    <img src="http://cdn.skholr.com/thumb_sankalp.jpg" class="img-fluid">
                </a>
                <a href="https://www.linkedin.com/in/shrivardhanrao/" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-2">
                    <img src="http://cdn.skholr.com/thumb_shri.jpg" class="img-fluid">
                </a>
            </div>
        </div>
    </div>
</asp:Content>


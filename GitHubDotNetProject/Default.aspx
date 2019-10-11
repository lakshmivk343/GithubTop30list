<%@ Page Title="GitHub Stars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GitHubDotNetProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  
     <script type="text/javascript">
        var apiUrlSearch = 'https://api.github.com/search/repositories'
        
         $(document).ready(function () {

        $.ajax({
            type: "GET",
            url: apiUrlSearch + "?q=language:java&sort=stars&order=desc",
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                $("#DIV").html('');
                var DIV = '';
                $.each(data.items, function (i, item) {
                    var rows = "<tr>" +
                        "<td id='full_name'>" + item.full_name + "</td>" +
                        "<td id='html_url'>" + item.html_url + "</td>" +
                        "<td id='description'>" + item.description + "</td>" +
                        "<td id='stargazers_count'>" + item.stargazers_count + "</td>" +
                        "</tr>";
                    $('#Table').append(rows);
                }); 
                console.log(data);
            },

            failure: function (data) {
                alert(data.responseText);
            }, 
            error: function (data) {
                alert(data.responseText);
            } 

        });
    });
</script>

    <div class="panel panel-primary">
    <div class="panel-heading">
        Git Repository Rating
    </div>   
    <div class="panel-body">
        <table class="table table-bordered" id="Table">
            <tr>
                <th>Name</th>
                <th>Repository_Url</th>
                <th>Description</th>
                <th>Stars_Count</th>
          </tr>  
        </table>   
    </div>
</div> 
</asp:Content>

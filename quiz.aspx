

<%@ Import Namespace="System.Xml" %>
<script language="VB" runat="server">

'Relative file path to XML data
Dim strXmlFilePath as String = Server.MapPath("quiz.xml")

Dim xDoc as XmlDocument = New XmlDocument()
Dim intTotalQuestion as Integer
Dim intQuestionNo as Integer = 1
Dim intScore as Integer = 0
Dim arrAnswerHistory as new ArrayList()

Sub Page_Load(src as Object, e as EventArgs)

	'Load xml data
	xDoc.Load(strXmlFilePath)

	'Start a new quiz?
	If Not Page.IsPostBack Then

		'Yes! Count total question
		intTotalQuestion = xDoc.SelectNodes("/quiz/mchoice").Count

		'Record start time
		ViewState("StartTime") = DateTime.Now

		ShowQuestion(intQuestionNo)
	End If
End Sub


Sub btnSubmit_Click(src as Object, e as EventArgs)

	'Retrieve essential variables from state bag
	intTotalQuestion = ViewState("TotalQuestion")
	intQuestionNo = ViewState("QuestionNo")
	intScore = ViewState("Score")
	arrAnswerHistory = ViewState("AnswerHistory")

	'Correct answer?
	If rblAnswer.SelectedItem.Value = ViewState("CorrectAnswer") Then
		intScore += 1
		arrAnswerHistory.Add(0)
	Else
		arrAnswerHistory.Add(rblAnswer.SelectedItem.Value)
	End If

	'End of quiz?
	If intQuestionNo=intTotalQuestion Then

		'Yes! Show the result...
		QuizScreen.Visible = False
            ResultScreen.Visible = True

            
          

		'Render result screen
		ShowResult()

	Else

		'Not yet! Show another question...
		QuizScreen.Visible = True
		ResultScreen.Visible = False
		intQuestionNo += 1
	
		'Render next question
		ShowQuestion(intQuestionNo)
	End If
End Sub


Sub ShowQuestion(intQuestionNo as Integer)
	Dim xNodeList as XmlNodeList
	Dim xNodeAttr as Object
	Dim strXPath as String
	Dim i as Integer
	Dim tsTimeSpent as TimeSpan

	strXPath = "/quiz/mchoice[" & intQuestionNo.ToString() & "]"

	'Extract question
	lblQuestion.Text = intQuestionNo.ToString() & ". " & xDoc.SelectSingleNode(strXPath & "/question").InnerXml

	'Extract answers
	xNodeList = xDoc.SelectNodes(strXPath & "/answer")

	'Clear previous listitems
	rblAnswer.Items.Clear
	
	For i = 0 to xNodeList.Count-1

		'Add item to radiobuttonlist
		rblAnswer.Items.Add(new ListItem(xNodeList.Item(i).InnerText, i+1))

		'Extract correct answer
		xNodeAttr = xNodeList.Item(i).Attributes.ItemOf("correct")
		If not xNodeAttr is Nothing Then
			If xNodeAttr.Value = "yes" Then
				ViewState("CorrectAnswer") = i+1
			End If
		End If
	Next

	'Output Total Question
	lblTotalQuestion.Text = intTotalQuestion

	'Output Time Spent
	tsTimeSpent = DateTime.Now.Subtract(ViewState("StartTime"))
	lblTimeSpent.Text = tsTimeSpent.Minutes.ToString() & ":" & tsTimeSpent.Seconds.ToString()

	'Store essential data to viewstate
	ViewState("TotalQuestion") = intTotalQuestion
	ViewState("Score") = intScore
	ViewState("QuestionNo") = intQuestionNo
	ViewState("AnswerHistory") = arrAnswerHistory

End Sub

Sub ShowResult()
	Dim strResult as String
	Dim intCompetency as Integer
	Dim i as Integer
	Dim strXPath as String
	Dim tsTimeSpent as TimeSpan
	
	tsTimeSpent = DateTime.Now.Subtract(ViewState("StartTime"))

        strResult = "<div class='wrapper row1'>"
        strResult += "<div id='header' class='clear'>"
        strResult += "<div class='fl_left'>"
        strResult += "<h1><font color='white'>E-placement Corner</font></h1>"
        strResult += "<p>Online Management to placement cell</p>"
        strResult += "</div>"
        strResult += "</div>"
        strResult += "</div>"
       
        strResult += "<center>"
        strResult += "<table>"
        strResult += "<tr class='heading'>"
        strResult += "<td ><font color='white'><b>Apptitude test</b></font></td>"
        strResult += "<td width='50%' align='right'><font color='white'></font></td>"
        strResult += "  </tr>"
        strResult += "</table>"
         
        
        
	strResult += "<h3>Quiz Result</h3>"
	strResult += "<p >Points: " & intScore.ToString() & " of " & intTotalQuestion.ToString()
	strResult += "<p>Your Competency: " & Int(intScore/intTotalQuestion*100).ToString() & "%"
	strResult += "<p>Time Spent: " & tsTimeSpent.Minutes.ToString() & ":" & tsTimeSpent.Seconds.ToString()
	strResult += "</center>"

	strResult += "<h3>Quiz Breakdown:</h3>"
	For i = 1 to intTotalQuestion
		strXPath = "/quiz/mchoice[" & i.ToString() & "]"
		strResult += "<b>" & i.ToString() & ". " & xDoc.SelectNodes(strXPath & "/question").Item(0).InnerXml & "</b><br>"
		If arrAnswerHistory.Item(i-1)=0 Then
			strResult += "<font color=""green""><b>Correct</b></font><br><br>"
		Else
			strResult += "<b>You answered:</b> " & xDoc.SelectNodes(strXPath & "/answer[" & arrAnswerHistory.Item(i-1).ToString() & "]").Item(0).InnerXml & "<br>"
			strResult += "<font color=""red""><b>Incorrect</b></font><br><br>"
		End If
        Next
        strResult += "<div class='wrapper'>"
        strResult += "<div id='copyright' class='clear' >"
        strResult += "<p class='fl_left'width='100%'>Copyright &copy; 2014 - All Rights Reserved - <a href='#'>Major Project</a></p>"
        strResult += "<p class='fl_right' width='50%'>Design by :-Kushal & Setu</p>"
        strResult += "</div>"
        strResult += "</div>"
 
        
	lblResult.Text = strResult
End Sub

</script>
<html>
<head>
<title>E placement Corner</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.8.2.min.js"></script>
</head>

<style>
body {
  font-size: 10pt;
  font-family: verdana,helvetica,arial,sans-serif;
  color:#000000;
  background-color:white;
  <%--background-color:#eeeedd;--%>
  
}

tr.heading {
  background-color:#03274B;
}

.button {
	border: 1px solid #000000;
	background-color: #03274B;
	color : White;
}

</style>

<body>
<span id="QuizScreen" runat="server">
<form runat="server">
<div class="wrapper row1">
    <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="home.aspx">E-placement Corner</a></h1>
      <p>Online Management to placement cell</p>
    </div>
    
  </div>
</div>
<table width="100%" border="0" cellpadding="2" cellspacing="0" >
  <tr class="heading">
    <td width="50%"><font color="white"><b>Apptitude test</b></font></td>
	<td width="50%" align="right"><font color="white"></font></td>
  </tr>
  <tr>
    <td colspan="2">
	  <b><asp:label id="lblQuestion" runat="server" /></b><br>
      <asp:radiobuttonlist
	     id="rblAnswer"
		 RepeatDirection="vertical"
		 TextAlign="right"
		 RepeatLayout="table"
		 runat="server" /><br>
	  <asp:requiredfieldvalidator
		 ControlToValidate="rblAnswer"
		 ErrorMessage="Please pick an answer!"
		 runat="server" /><br>
      <asp:button id="btnSubmit" class="button" text="  Next  " onClick="btnSubmit_Click" runat="server" />
	</td>
  </tr>
  <tr class="heading">
    <td width="50%"><font color="white"><b>Total <asp:label id="lblTotalQuestion" runat="server" /> questions</b></font></td>
	<td width="50%" align="right"><font color="white"><b>Time spent <asp:label id="lblTimeSpent" runat="server" /></b></font></td>
  </tr>
</table>


<div class="wrapper">
  <div id="copyright" class="clear">
    <p class="fl_left" >Copyright &copy; 2014 - All Rights Reserved - <a href="#">Major Project</a></p>
    <p class="fl_right">Design by :-<a href="" title="E-placement Corner">Kushal & Setu</a></p>
  </div>
</div>

</form>
</span>

<span id="ResultScreen" runat="server" >
<asp:label id="Label_marks" runat="server" />
 
<asp:label id="lblResult" runat="server" />
</span>
   

</body>
</html>

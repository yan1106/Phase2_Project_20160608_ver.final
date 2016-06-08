<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DOE.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="../JS/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"></script>
<script src="../JS/jquery-ui-1.9.2/jquery-1.10.0.min.js" type="text/javascript"></script>    
<script src="../JS/jquery-ui-1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="../JS/jquery-ui-1.9.2/jquery-ui.css" rel="stylesheet" type="text/css" />  

    <title>DOE</title>
   
    <style type="text/css">

.font8
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:細明體, monospace;
	}
.font6
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	}
        .style-doe-head{
            width:300px;
            height:50px;

        }
        .style-doe-head-2{
            width:500px;
            height:50px;

        }
        .style-doe-head-blue
        {
            width:1000px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #538ED5;
        }
        .style-doe-head-gray
        {
           
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #7F7F7F;
        }
        
        .style-doe-head-orange
        {
            width:400px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            /*padding-left: 2px;
            padding-right: 2px;
            padding-top: 2px;
            padding-bottom: 2px;*/
            
            background: #FFC000;
        }
        .auto-style1 {
            width: 200px;
            height:20px;
        }
    </style>
<script type="text/javascript">
        
        
        var save_row = 0;
        var rowspan_count = 0;
        var row_count = 0;
        var row_array = new Array();        
        var temp = 0;
        var but2_delete_temp = 0;
        var count_but1 = 0;
        var count_but2 = 0;
        
        var rowspan_temp=0;
        var but1_row = 0;
        var but2_row = 0;
        var delete_but1 = 0;
        var delete_but2 = 0;
        var but1_row_sign = 0;
        var but2_row_sign = 0;

        var but1_row_count = 0;
        var but2_row_count = 0;

        var but_id_sign;
        var num1 = 0;
        var num2 = 0;

        var result_but1 = 0;
        var result_but2 = 0;
        var result_but3 = 0;
        var result_but4 = 0;

        

        function index(r) {

            
            var row_obj

            row = r.parentNode.parentNode.rowIndex;
            row_array[temp] = row;
           

            if (row != row_array[temp - 1]) {
                row_count = 0;
            }


            var obj = event.srcElement;
            if (obj.id == "but1")
            {
                num1 = 1;
                num2 = 0;
                but1_row = row;                
                count_but1++;
                but1_row_sign = count_but1;
                
                but1_row_count = but1_row_sign+but1_row;
                 
                row_obj = document.getElementById('doe_1').insertRow(but1_row_count);
                row_obj.id = 'row_' + but1_row.toString() + "-" + (but1_row_count).toString();
                //row_obj.className = "row_" + row.toString();
                var mums_2_0 = document.getElementById('doe_1').rows[row].cells[0].rowSpan = count_but1 + 1;
                var mums_2_1 = document.getElementById('doe_1').rows[row].cells[1].rowSpan = count_but1 + 1;
                var mums_2_2 = document.getElementById('doe_1').rows[row].cells[2].rowSpan = count_but1 + 1;
                but_id_sign = but1_row;







                for (i = 0; i < 14; i++) {

                    var a = row_obj.insertCell(i);

                    a.id = "td_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString();

                    if (i == 0) {

                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString();

                        btn.value = "Delete"
                        btn.addEventListener('click', function () { deleteRow(this) });


                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).appendChild(btn);
                        /*
                        but_id_sign = but1_row;
                        row_count = but1_row_sign + but1_row;
                        but1_row_sign = count_but1;
                        */
                       



                        if(but1_row_count-1>=3)
                        document.getElementById("but_" + but_id_sign.toString() + "-" + (but1_row_count - 1).toString() + "_" + i.toString()).style.visibility = "hidden";
                        
                        

                    }
                    if (i == 1) {
                        a.innerHTML = "+";
                    }
                    if (i == 2) {
                        a.innerHTML = "-";
                    }
                    if (i == 12) {
                        var text = document.createElement("INPUT");
                        text.type = "text";
                        text.id = "text_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString();
                        text.value = but_id_sign.toString() + "-" + (but1_row_count).toString() + '_' + i.toString();

                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).appendChild(text);
                        document.getElementById("text_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).style.width = "50%";
                        //a.innerHTML = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();


                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString();

                        btn.value = "+"
                        var str = but_id_sign.toString() + "-" + (but1_row_count).toString();
                        //inputElement.addEventListener('click', function(){otoNode(result.name)});
                        btn.addEventListener('click', function () { addselect(str, this) });
                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).appendChild(btn);
                        //a.innerHTML = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();
                    }

                    if (i != 0 && i != 1 && i != 2 && i != 12) {
                        if (i == 13) {
                            break;
                        }
                        var text = document.createElement("INPUT");
                        text.type = "text";
                        text.id = "text_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString();
                        //text.value = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();

                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).appendChild(text);
                        document.getElementById("text_" + but_id_sign.toString() + "-" + (but1_row_count).toString() + "_" + i.toString()).style.width = "90%";
                        //a.innerHTML = (row_count).toString() + '_' + i.toString();
                    }



                }

            }
            if (obj.id == "but2")
            {

                num1 = 0;
                num2 = 1;
               
                but2_row = row;                
                count_but2++;     /*處理but2的rowspan*/
                but2_row_sign++;  /*處理but2的新增列數*/
                but2_row_count = but2_row + but2_row_sign;
               
                row_obj = document.getElementById('doe_1').insertRow(but2_row_count);
                row_obj.id = 'row_' + but2_row.toString() + "-" + (but2_row_count).toString();
                row_obj.className = "row_" + row.toString();
                var mums_2_0 = document.getElementById('doe_1').rows[but2_row].cells[0].rowSpan = count_but2 + 1;
                var mums_2_1 = document.getElementById('doe_1').rows[but2_row].cells[1].rowSpan = count_but2 + 1;
                var mums_2_2 = document.getElementById('doe_1').rows[but2_row].cells[2].rowSpan = count_but2 + 1;
                but_id_sign = but2_row;





                for (i = 0; i < 14; i++) {

                    var a = row_obj.insertCell(i);

                    a.id = "td_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString();

                    if (i == 0) {

                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString();

                        btn.value = "Delete"
                        btn.addEventListener('click', function () { deleteRow(this) });


                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).appendChild(btn);
                        /*
                        but_id_sign = but1_row;
                        row_count = but1_row_sign + but1_row;
                        but1_row_sign = count_but1;
                        */

                        var rowindex = document.getElementById('ee').rowIndex;
                       
                        var leng = document.getElementById("doe_1").rows.length;
                        
                        var val = leng - 2;
                        var obj_len = document.getElementById('doe_1').rows[val].id;
                        
                        var temp_obj_len = obj_len.split('-');
                        var temp_obj_sign = temp_obj_len[0].split('_');
                        
                        

                        

                        if (but2_row_count - 1 > rowindex)
                            //alert("but_" + (temp_obj_sign[1]).toString() + "-" + (temp_obj_len[1]).toString() + "_" + i.toString());
                             document.getElementById("but_" + (temp_obj_sign[1]).toString() + "-" + (temp_obj_len[1]).toString() + "_" + i.toString()).style.visibility = "hidden";
                        

                    }
                    if (i == 1) {
                        a.innerHTML = "+";
                    }
                    if (i == 2) {
                        a.innerHTML = "-";
                    }
                    if (i == 12) {
                        var text = document.createElement("INPUT");
                        text.type = "text";
                        text.id = "text_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString();
                        text.value = but_id_sign.toString() + "-" + (but2_row_count).toString() + '_' + i.toString();

                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).appendChild(text);
                        document.getElementById("text_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).style.width = "50%";
                        //a.innerHTML = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();


                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString();

                        btn.value = "+"
                        var str = but_id_sign.toString() + "-" + (but2_row_count).toString();
                        //inputElement.addEventListener('click', function(){otoNode(result.name)});
                        btn.addEventListener('click', function () { addselect(str, this) });
                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).appendChild(btn);
                        //a.innerHTML = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();
                    }
                    if(i!=0 && i !=1 && i!=2 && i!=12){
                   
                     if (i == 13) {
                            break;
                        }
                        var text = document.createElement("INPUT");
                        text.type = "text";
                        text.id = "text_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString();
                        //text.value = but_id_sign.toString() + "-" + (row_count).toString() + '_' + i.toString();

                        a = document.getElementById("td_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).appendChild(text);
                        document.getElementById("text_" + but_id_sign.toString() + "-" + (but2_row_count).toString() + "_" + i.toString()).style.width = "90%";
                        //a.innerHTML = (row_count).toString() + '_' + i.toString();
                    }



                }

              
            }
                     
          
           
                   
            temp++;
        }

        function deleteRow(z) {           
            var i = z.parentNode.parentNode.rowIndex;
            //var delete_id = new Array();
            var delete_id = z.id.split('_');
            var delete_id_2 = delete_id[1].split('-');
            
            

            if (i >= document.getElementById("ee").rowIndex) {

                
                
                    count_but2--;
                    but2_row_count--;
                    var mums_2_0 = document.getElementById('doe_1').rows[document.getElementById("ee").rowIndex].cells[0].rowSpan = count_but2 + 1;
                    var mums_2_1 = document.getElementById('doe_1').rows[document.getElementById("ee").rowIndex].cells[1].rowSpan = count_but2 + 1;
                    var mums_2_2 = document.getElementById('doe_1').rows[document.getElementById("ee").rowIndex].cells[2].rowSpan = count_but2 + 1;
                    but2_row_sign--;
                    document.getElementById("doe_1").deleteRow(i);

                    var title_len = document.getElementById("doe_1").rows.length;
                    var id = delete_id_2[1];
                    
                    var rowindex = document.getElementById('ee').rowIndex;

                    var leng = document.getElementById("doe_1").rows.length;

                    var val = leng - 1;
                    var obj_len = document.getElementById('doe_1').rows[val].id;

                    var temp_obj_len = obj_len.split('-');
                    var temp_obj_sign = temp_obj_len[0].split('_');
                    //alert("but_" + (temp_obj_sign[1]).toString() + "-" + (temp_obj_len[1]).toString() + "_" + (0).toString());
                    document.getElementById("but_" + (temp_obj_sign[1]).toString() + "-" + (temp_obj_len[1]).toString() + "_" + (0).toString()).style.visibility = "visible";
                    

            }
            else {
               
                
                    count_but1--;
                    var mums_2_0 = document.getElementById('doe_1').rows[but1_row].cells[0].rowSpan = count_but1 + 1;
                    var mums_2_1 = document.getElementById('doe_1').rows[but1_row].cells[1].rowSpan = count_but1 + 1;
                    var mums_2_2 = document.getElementById('doe_1').rows[but1_row].cells[2].rowSpan = count_but1 + 1;
                    
                    document.getElementById("doe_1").deleteRow(i);
                    
                   
                    document.getElementById("but_" + but1_row.toString() + "-" + (i-1).toString() + "_" + (0).toString()).style.visibility = "visible";
            }


                     
            
           
        }
        
        function addselect(str,j)
        {
            result_but1++;

           

            var myOption;
            var i = j.parentNode.parentNode.rowIndex;
            var select_temp = "td_" + str + "_13";
            var res_Select = document.createElement("Select");
            res_Select.name = "DOE_result";
            res_Select.id = "Sel_" + str+"_13_" + result_but1.toString();
            document.getElementById(select_temp).appendChild(res_Select);

            myOption = document.createElement("option");
            myOption.text = "AVG";
            myOption.value = "AVG";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MAX";
            myOption.value = "MAX";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MIN";
            myOption.value = "MIN";
            res_Select.appendChild(myOption);
            

            var btn = document.createElement("INPUT");
            btn.type = "button";
            btn.id = "but_" + str + "_13_" + result_but1.toString();

            btn.value = "-"
            var temp = str + "_13"; //str = but_id_sign.toString() + "-" + (row_count).toString();
            btn.addEventListener('click', function () { deleteSelect(temp,this) });

            a = document.getElementById("td_" + str + "_13").appendChild(btn);

          
        }
        
      


      function deleteSelect(y,op)
        {

          var id = op.id
          var td_id = op.parentNode.id;
          var temp_str = new Array();
          var temp_str = id.split('_');
          
         
                 
          var sign_id = temp_str[3];

          
          var parent = document.getElementById(td_id);
          var temp_sel = "Sel_" + y+ "_"+sign_id;
          var temp_but = "but_" + y + "_" + sign_id;
          
          //alert(temp_sel + "\n" + temp_but);

          var select = document.getElementById(temp_sel);
          var but = document.getElementById(temp_but);
         
          parent.removeChild(but);
          parent.removeChild(select);
        }
        
      function addselect_but() {
          result_but3++;

          var myOption;
                   
          var res_Select = document.createElement("Select");
          res_Select.name = "DOE_result";
          res_Select.id = "Sel_" + result_but3.toString();
          document.getElementById("but3_doe").appendChild(res_Select);

          myOption = document.createElement("option");
          myOption.text = "AVG";
          myOption.value = "AVG";
          res_Select.appendChild(myOption);
          myOption = document.createElement("option");
          myOption.text = "MAX";
          myOption.value = "MAX";
          res_Select.appendChild(myOption);
          myOption = document.createElement("option");
          myOption.text = "MIN";
          myOption.value = "MIN";
          res_Select.appendChild(myOption);


          var btn = document.createElement("INPUT");
          btn.type = "button";
          btn.id = "but_" + result_but3.toString();

          btn.value = "-"
          btn.addEventListener('click', function () { deleteSelect_but(this) });
          
          a = document.getElementById("but3_doe").appendChild(btn);


      }




      function deleteSelect_but(local) {
          
          var id_but = local.id
         
          var temp_str_but = new Array();
          var temp_str_but = id_but.split('_');
          
         
          
          var sign_id_but = temp_str_but[1];



          var parent = document.getElementById('but3_doe');
          
          var temp_sel = "Sel_" + sign_id_but;
          var temp_but = "but_" + sign_id_but;
          
          var select = document.getElementById(temp_sel);
          var but = document.getElementById(temp_but);
          
          parent.removeChild(select);
          parent.removeChild(but);

         
      }




    </script>
</head>







<body>
    <form id="form1" runat="server">
  <fieldset style="width:95%;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">DOE SET</legend>   
        <div id="div1">
            <!--border-collapse:collapse,要讓欄位邊框合併-->
            <table id="doe_1" border="1" style="border-color:black;width:100%;height:50%;border-collapse:collapse;">
                 <tr>
                     <td class="style-doe-head-blue" rowspan="2" >                     
                        <div>Area</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a1"></div>
                      <div>Control Item</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a2"></div>
                      <div>SPEC</div>
                     </td>
                     
                     <td class="style-doe-head-gray" style="width:400px;" rowspan="2" colspan="5">
                         <div id="show_len"></div>
                        <div>DOE LEGS</div>
                     </td>
                     <td class="style-doe-head-gray" style="width:550px;" rowspan="2" >
                         <div style="font-size:20px;">Wafer Qn'ty</div>
                     </td>                  
                     <td class="style-doe-head-orange" colspan="3">
                         <div>Wafer Count</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Atrribute</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Note</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Lot Number</div>
                     </td>
                     <td class="style-doe-head-orange" style="width:900px;" rowspan="2">
                         <div style="font-size:15pt">Due date</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                          <div style="font-size:15pt">Result</div>
                     </td>                                      
                </tr>
                <tr>
                    <td style="width:100px; height:50px" class="style-doe-head-orange">
                        <div>DM</div>
                    </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>PC</div>
                     </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>Live</div>
                     </td>                                                                                               
                </tr>
                <tr id="row_2">
                    <td ><div>PR STRIP</div></td>
                     <td ><div>Process time</div></td>
                     <td>
                         330+/-10%
                         
                         <input id="but1" type="button" onclick="index(this)" value="+" />                
                     </td>
                     <td></td>
                     <td>+</td>
                     <td>-</td>
                     <td><input id="doelge_1" name="doelge_1" type="text"  style="width:40px" value="0"/></td>
                     <td><input id="doelge_2" name="doelge_2" type="text"   style="width:40px" value=""/></td>
                     <td><input id="doelge_3" name="doelge_3" type="text"   style="width:40px" value="3"/></td>
                     <td><input id="doelge_4" name="doelge_4" type="text"   style="width:40px" value=""/></td>
                     <td><input id="doelge_5" name="doelge_5" type="text"   style="width:40px" value=""/></td>
                     <td><input id="doelge_6" name="doelge_6" type="text"   style="width:40px" value="" /></td>
                     <td><input id="doelge_7" name="doelge_7" type="text"   style="width:150px" value="1. ASTI (十字檢查法)"/></td>
                     <td><input id="doelge_8" name="doelge_8" type="text"  style="width:40px" value="NA"/></td>
                     <td><input id="doelge_9" name="doelge_9" type="text"  style="width:90px" value="BPF56180.1"/></td>
                     <td>
                         <input id="doelge_10" name="doelge_10" type="text"   style="width:70px" value="2015/5/24"/>
                         <input id="doelge_11" type="button" value="+" onclick="addselect_but()" />
                     </td>
                     <td id="but3_doe"></td>                                    
                </tr>
                
                
                <tr id="ee" style="height:20px">
                     <td></td>
                     <td></td>
                     <td><input id="but2" type="button" onclick="index(this)" value="+" /></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                       <td></td>
                    <td ></td>                      
                </tr>
               




            </table>


        </div>

      </fieldset>
        <div id="h1"></div>
        <div id="h2"></div>
    </form>
</body>
</html>
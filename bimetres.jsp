<%	
		//Funcion llamada por patente.jsp
		java.util.Date f_actual = new java.util.Date();
        
        //Formato solo mes
        SimpleDateFormat f_mes = new SimpleDateFormat("MM");
		
        mm = f_mes.format(f_actual);
		int mmint = Integer.parseInt(mm);
		if ((mmint >=1) && (mmint<=2)){
			mm="01";
		}
		if ((mmint >=3) && (mmint<=4)){
			mm="02";
		}
		if ((mmint >=5) && (mmint<=6)){
			mm="03";
		}
		if ((mmint >=7) && (mmint<=8)){
			mm="04";
		}
		if ((mmint >=9) && (mmint<=10)){
			mm="05";
		}
		if ((mmint >=11) && (mmint<=12)){
			mm="06";
		}
		
%>

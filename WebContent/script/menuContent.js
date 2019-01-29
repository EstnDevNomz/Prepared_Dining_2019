		//declare array for 'Basket' list
		var basketArr = new Array();
		var mnArr = new Array();
		var prArr = new Array()
		var total = 0;
		
		function bookmenu($mn, $menuImg, $pr) {	

			var pr = Number($pr);
			var filename = $menuImg.substring($menuImg.lastIndexOf("/"), $menuImg.length);
			// menu insert into the Array
			basketArr.push(filename);
			mnArr.push($mn);
			prArr.push(pr);

			// output
			for ( var i = 0; i < 8; i++ ) {
				//'i' == status index by JSTL
				$('.thumbnail' + i).attr('src', 'img' + basketArr[i]);
				$('.menuname' + i).val(mnArr[i]);
				$('.menuname' + i).text(mnArr[i]);
				$('.product' + i).text(mnArr[i]); //payment
				$('.price' + i).text(prArr[i]); //payment
				
			}
			function add(acc, value) {
				return acc + value;
			}
			//jQuery('.menuname').val(mnArr[*]);		
			var mSum = mnArr.reduce(add, 0);
			var mTot = mnArr.reduce(function(a, b) {return a +', '+ b;});
			$('.menuname').val(mTot);

			// total price by reduce() methods
			var sum = prArr.reduce(add, 0);
			var sum = prArr.reduce(function(a, b) {return a + b;});
			
			var sum = sum.toFixed(2);	//소수점2자리
			//sum = +sum.toFixed(2);	// 뒤에 0 제거
			$('.withdraw').val(sum);
			$('.paysum').text("$"+sum+"USD");
			$('.paysum').val(sum);
			
		}
		// Clear All product
		function clearBasket() {
			for ( var i = 0; i < 8; i++ ) {
				//'i' == status index by JSTL
				$('.thumbnail' + i).attr('src', '');
				$('.menuname' + i).val('');
				$('.product' + i).text(''); //payment
				$('.price' + i).text(''); //payment

			}
			mnArr.splice(0,mnArr.length);
			prArr.splice(0,prArr.length);
			basketArr.splice(0,basketArr.length);
			total = 0;
			filename= null;
		
			$('.menuname').val('');
			$('.menuname').text('')
			$('.menuname0').text('')
			$('.menuname1').text('')
			$('.menuname2').text('')
			$('.menuname3').text('')
			$('.menuname4').text('')
			$('.menuname5').text('')
			$('.menuname6').text('')
			$('.menuname7').text('')
			$('.menuname8').text('')
			$('.withdraw').val(0);
			$('.withdraw').text(0);
			$('.paysum').val(0);
			$('.paysum').text(0);
			
		}
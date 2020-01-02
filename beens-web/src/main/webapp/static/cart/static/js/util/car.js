/*
 *@Author: xuzhiwen
 *@Copyright:layui.com
 */
var ids="";
var ids1="";
layui.define(
	[ 'layer' ],
	function(exports) {
		var layer = layui.layer;
			var car = {
				init : function() {
					var uls = document.getElementById('list-cont').getElementsByTagName('ul');// 每一行
					var goods = document.getElementsByClassName("goods");
					var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
					var checkAll = document.getElementsByClassName('check-all'); // 全选框
					var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];// 总件数
					var piecesTotal = document.getElementsByClassName('pieces-total')[0];// 总价
					var batchdeletion = document.getElementsByClassName('batch-deletion')[0];// 批量删除按钮
					var settlement = document.getElementById('settlement');	//结算按钮
					// 计算
					function getTotal(){
						var seleted = 0,price = 0;
						for(var i = 0; i < uls.length;i++){
							if(uls[i].getElementsByTagName('input')[0].checked){
								seleted +=parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
								price +=parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
							}
						}
						 		SelectedPieces.innerHTML = seleted;
						 		piecesTotal.innerHTML = '￥' + price.toFixed(2);
					}
					

						function fn1() {
							alert(1)
						}
						
						//记录勾选商品的id
						for(var i = 0; i < goods.length; i++){
							if (i == goods.length - 1){
								ids += goods[i].innerHTML
							}
							ids += goods[i].innerHTML + ",";
						}

						// 小计
						function getSubTotal(ul) {
							var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
							var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
							var SubTotal = parseFloat(unitprice * count);
							ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
						}

						for (var i = 0; i < checkInputs.length; i++) {
							checkInputs[i].onclick = function() {
								
								if (this.className === 'check-all check') {
									for (var j = 0; j < checkInputs.length; j++) {
										checkInputs[j].checked = this.checked;
									}
									ids = "";
									if(this.checked){
										for(var k = 0; k < goods.length; k++){
											if (k == goods.length - 1){
												ids += goods[k].innerHTML
											}else {
												ids += goods[k].innerHTML + ",";
											}
										}
									}
								}
								if (this.checked == false) {
									for (var k = 0; k < checkAll.length; k++) {
										checkAll[k].checked = false;
										
									}
								}else {
									var flag = true;
									for (var i = 1; i < checkInputs.length && checkInputs.length > 1; i++) {
										if (checkInputs[i].checked == false){
											flag = false;
											break;
										}
									}
									if (flag){
										checkAll[0].checked = true;
									}
								}
								
								//记录勾选复选框的id
								var foodClass = this.parentNode.parentNode.parentNode.parentNode.getElementsByClassName('goods')[0];
								
								if(foodClass != undefined){
									if(this.checked == true){
										ids1 = ids;
										if (ids1 != ""){
											ids1 += (","+foodClass.innerHTML);
										}else {
											ids1 += foodClass.innerHTML;
										}
										
									}else if (ids != ''){
										var index = ids.split(",");
										ids1 = "";
										for(var j = 0;j<index.length;j++){
											if(foodClass.innerHTML != index[j]){
												if (ids1 != ""){
													ids1 += (","+index[j]);
												}else {
													ids1 += index[j]
												}
											}
										}
									}
									ids = ids1;
								}
								
								getTotal()
							}
						}

						for (var i = 0; i < uls.length; i++) {
							uls[i].onclick = function(e) {
								e = e || window.event;
								var el = e.srcElement;
								var cls = el.className;
								var input = this.getElementsByClassName('Quantity-input')[0];
								var less = this.getElementsByClassName('less')[0];
								var val = parseInt(input.value);
								var that = this;
								
								//购物车项id
								var goodsId = this.getElementsByClassName('goods')[0].innerHTML;
								//食物id
								var foodId = this.getElementsByClassName('food')[0].innerHTML;
								
								switch (cls) {
									case 'add layui-btn':
										input.value = val + 1;
										//异步请求
										numChange(goodsId,input.value,foodId);
										getSubTotal(this)
										break;
									case 'less layui-btn':
										if (val > 1) {
											input.value = val - 1;
										}
										//异步请求
										numChange(goodsId,input.value,foodId);
										getSubTotal(this)
										break;
									case 'dele-btn':
										layer.confirm('你确定要删除吗', {
											yes : function(index, layero) {
												//删除请求
												deleteById(goodsId);
												
												layer.close(index)
												that.parentNode.removeChild(that);
												getTotal();
											}
										})
										break;
									}
									getTotal();
								}
							}

							batchdeletion.onclick = function() {
								if (SelectedPieces.innerHTML != 0) {
									layer.confirm('你确定要删除吗',{
										yes : function(index,layero) {
											layer.close(index)
												for (var i = 0; i < uls.length; i++) {
													var input = uls[i].getElementsByTagName('input')[0];
													if (input.checked) {
														batchDelete(ids);
														uls[i].parentNode.removeChild(uls[i]);
														i--;
													}
												}
												getTotal();
											}

										})
								} else {
									layer.msg('请选择商品')
								}

							}
							checkAll[0].checked = true;
							checkAll[0].onclick();
							
							settlement.onclick = function(){
								doSettlement(ids);
							}
						}

					}

					exports('car', car)
					
});



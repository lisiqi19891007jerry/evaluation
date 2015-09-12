var myScroll=null;

function initScroll() {

	if($("#wrapper").length > 0) {
		myScroll = new iScroll('wrapper', {
			useTransform : false,
			/*
			 * onBeforeScrollStart，这个属性方法是在滚动前调用的方法，
			 * 里面需要加入阻止元素默认行为的方法，否则在ipad上按钮、input框、色了传统框等均不能使用。
			 */
			onBeforeScrollStart : function(e) {
				var target = e.target;
				while (target.nodeType != 1) {
					target = target.parentNode;
					if (target.tagName != 'SELECT'
					 && target.tagName != 'INPUT'
					 && target.tagName != 'TEXTAREA') {
						e.preventDefault();
					}
				}
			}
		});
	}
}

function initEvent(){
	try {
		document.addEventListener('DOMContentLoaded',initScroll, false);
	} catch (e) {}
}

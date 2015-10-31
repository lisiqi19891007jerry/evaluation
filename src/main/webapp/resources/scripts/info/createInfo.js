function doSaveDataAction() {

	var number_judge = /^\d+(\.\d+)?$/;

	// 游戏名
	if ($("#in_game_name").val() == '' || $("#in_game_name").val() == "当前名（曾用名）") {
		showMessage("游戏名不能为空！");
		return false;
	} else if ($("#in_game_name").val().length > 20) {
		showMessage("输入的游戏名超过20个字符，请重新输入！");
		return false;
	}

	// 分类
	if ($('input:radio[name="game_type"]:checked').val() == null) {
		showMessage("请选择分类！");
		return false;
	}

	// 研发商
	if ($("#developName").val().length > 20) {
		showMessage("输入的研发商超过20个字符，请重新输入！");
		return false;
	}

	// 平台
	if ($('input:radio[name="platform_type"]:checked').val() == null) {
		showMessage("请选择平台类型！");
		return false;
	}

	// 测评日期
	if ($('#evaluation_date').val() == '') {
		showMessage("请输入测评日期！");
		return false;
	}

	// 发行商
	if ($("#sendName").val().length > 20) {
		showMessage("输入的发行商超过20个字符，请重新输入！");
		return false;
	}

	// 场景
	if ($('input:radio[name="scene"]:checked').val() == null) {
		showMessage("请选择场景类型！");
		return false;
	}

	// 测评人
	if ($('#tester').val() == null) {
		showMessage("请选择测评人！");
		return false;
	}

	// 游戏类型
	if ($("#in_game_type").val() == '' || $("#in_game_type").val() == '横版or竖版|大类.核心玩法(副类型.特例)') {
		showMessage("游戏类型不能为空！");
		return false;
	} else if ($("#in_game_type").val().length > 20) {
		showMessage("输入的游戏类型超过20个字符，请重新输入！");
		return false;
	}

	// 人物
	if ($('input:radio[name="show_person_type"]:checked').val() == null) {
		showMessage("请选择人物类型！");
		return false;
	}

	// 测评分
	var score = $('#score').val();

	if (score == '') {
		showMessage("测评分不能为空！");
		return false;
	} else if (!number_judge.test(parseFloat(score))) {
		showMessage("请在测评分输入0或正数！");
		return false;
	}

	// 游戏题材
	if ($("#in_game_theme").val() == '' || $("#in_game_theme").val() == '大类 .小类 | IP来源 | 热门IP') {
		showMessage("游戏题材不能为空！");
		return false;
	} else if ($("#in_game_theme").val().length > 20) {
		showMessage("输入的游戏题材超过20个字符，请重新输入！");
		return false;
	}

	// 绘画
	if ($('input:radio[name="painting_style_1"]:checked').val() == null) {
		showMessage("请选择绘画类型！");
		return false;
	}

	// 测评评级
	if ($('#evaluation_level').val() == null) {
		showMessage("请选择测评评级！");
		return false;
	}

	// 包体大小
	var packageSize = $('#packageSize').val();

	if (packageSize == '') {
		showMessage("包体大小不能为空！");
		return false;
	} else if (!number_judge.test(parseFloat(packageSize))) {
		showMessage("请在包体大小输入0或正数！");
		return false;
	}

	// 风格
	if ($('input:radio[name="painting_style_2"]:checked').val() == null) {
		showMessage("请选择风格类型！");
		return false;
	}

	//  竞品（战斗）
	if ($("#qualityGoods_combat").val().length > 20) {
		showMessage("输入的竞品（战斗）超过20个字符，请重新输入！");
		return false;
	}

	// 重度
	if ($('input:radio[name="playing_method"]:checked').val() == null) {
		showMessage("请选择重度类型！");
		return false;
	}

	// 竞品（养成）
	if ($("#qualityGoods_cultivate").val().length > 20) {
		showMessage("输入的竞品（养成）超过20个字符，请重新输入！");
		return false;
	}

	// 简评
	if ($("#game_comment").val().length > 1500) {
		showMessage("输入的简评超过1500个字符，请重新输入！");
		return false;
	}

	// 特色
	if ($("#feature").val().length > 100) {
		showMessage("输入的特色超过100个字符，请重新输入！");
		return false;
	}

	if ($('input:radio[name="area"]:checked').val() == '国内') {
		$("#areaValue").val('国内');
	} else if ($('input:radio[name="area"]:checked').val() == '海外') {
		$("#areaValue").val($('#oversea').val());
	} else {
		$("#areaValue").val('');
	}

//	$(".upload_btn").click();
	document.getElementById("createForm").submit();
}

function doCleanDataAction() {

	$('#in_game_name').val(''); // 游戏名
	$('input:radio[name="game_type"]').attr("checked", false); // 分类
	$("#retest_status").val(''); // 复测情况

	$('#developName').val(''); // 研发商
	$('input:radio[name="platform_type"]').attr("checked", false); // 平台
	$("#evaluation_date").val(''); // 测评日期

	$('#sendName').val(''); // 发行商
	$('input:radio[name="scene"]').attr("checked", false); // 场景
	$("#tester").val(''); // 测评人

	$('#in_game_type').val(''); // 游戏类型
	$('input:radio[name="show_person_type"]').attr("checked", false); // 人物
	$("#score").val(''); // 测评分

	$('#in_game_theme').val(''); // 游戏题材
	$('input:radio[name="painting_style_1"]').attr("checked", false); // 绘画
	$("#evaluation_level").val(''); // 测评评级

	$('#packageSize').val(''); // 包体大小
	$('input:radio[name="painting_style_2"]').attr("checked", false); // 风格
	$("#online_level").val(''); // 上线表现级别

	$("#qualityGoods_combat").val(''); // 竞品（战斗）
	$('input:radio[name="playing_method"]').attr("checked", false); // 重度
	$('input:radio[name="game_complete"]').attr("checked", false); // 游戏完成度

	$("#qualityGoods_cultivate").val(''); // 竞品（养成）
	$('input:radio[name="area"]').attr("checked", false); // 区域
	$("#oversea").val(''); // 海外
	$('input:radio[name="is_authorization"]').attr("checked", false); // 是否IP授权

	$("#game_comment").val(''); // 简评
	$("#feature").val(''); // 特色

	$('#attachment').val(''); // 附件
	$('#game_icon').val(''); // 游戏图标
}
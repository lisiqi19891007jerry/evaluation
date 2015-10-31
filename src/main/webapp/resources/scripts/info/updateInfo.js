function doUpateDataAction() {

	var number_judge = /^\d+(\.\d+)?$/;

	// 游戏名
	if ($("#upd_in_game_name").val() == '') {
		showMessage("游戏名不能为空！");
		return false;
	} else if ($("#in_game_name").val().length > 20) {
		showMessage("输入的游戏名超过20个字符，请重新输入！");
		return false;
	}

	// 分类
	if ($('input:radio[name="upd_game_type"]:checked').val() == null) {
		showMessage("请选择分类！");
		return false;
	}

	// 研发商
	if ($("#upd_developName").val().length > 20) {
		showMessage("输入的研发商超过20个字符，请重新输入！");
		return false;
	}

	// 平台
	if ($('input:radio[name="upd_platform_type"]:checked').val() == null) {
		showMessage("请选择平台类型！");
		return false;
	}

	// 测评日期
	if ($('#upd_evaluation_date').val() == '') {
		showMessage("请输入测评日期！");
		return false;
	}

	// 发行商
	if ($("#upd_sendName").val().length > 20) {
		showMessage("输入的发行商超过20个字符，请重新输入！");
		return false;
	}

	// 场景
	if ($('input:radio[name="upd_scene"]:checked').val() == null) {
		showMessage("请选择场景类型！");
		return false;
	}

	// 测评人
	if ($('#upd_tester').val() == null) {
		showMessage("请选择测评人！");
		return false;
	}

	// 游戏类型
	if ($("#upd_in_game_type").val() == '') {
		showMessage("游戏类型不能为空！");
		return false;
	} else if ($("#in_game_type").val().length > 20) {
		showMessage("输入的游戏类型超过20个字符，请重新输入！");
		return false;
	}

	// 人物
	if ($('input:radio[name="upd_show_person_type"]:checked').val() == null) {
		showMessage("请选择人物类型！");
		return false;
	}

	// 测评分
	var score = $('#upd_score').val();

	if (score == '') {
		showMessage("测评分不能为空！");
		return false;
	} else if (!number_judge.test(parseFloat(score))) {
		showMessage("请在测评分输入0或正数！");
		return false;
	}

	// 游戏题材
	if ($("#upd_in_game_theme").val() == '') {
		showMessage("游戏题材不能为空！");
		return false;
	} else if ($("#in_game_theme").val().length > 20) {
		showMessage("输入的游戏题材超过20个字符，请重新输入！");
		return false;
	}

	// 绘画
	if ($('input:radio[name="upd_painting_style_1"]:checked').val() == null) {
		showMessage("请选择绘画类型！");
		return false;
	}

	// 测评评级
	if ($('#upd_evaluation_level').val() == null) {
		showMessage("请选择测评评级！");
		return false;
	}

	// 包体大小
	var packageSize = $('#upd_packageSize').val();

	if (packageSize == '') {
		showMessage("包体大小不能为空！");
		return false;
	} else if (!number_judge.test(parseFloat(packageSize))) {
		showMessage("请在包体大小输入0或正数！");
		return false;
	}

	// 风格
	if ($('input:radio[name="upd_painting_style_2"]:checked').val() == null) {
		showMessage("请选择风格类型！");
		return false;
	}

	//  竞品（战斗）
	if ($("#upd_qualityGoods_combat").val().length > 20) {
		showMessage("输入的竞品（战斗）超过20个字符，请重新输入！");
		return false;
	}

	// 重度
	if ($('input:radio[name="upd_playing_method"]:checked').val() == null) {
		showMessage("请选择重度类型！");
		return false;
	}

	// 竞品（养成）
	if ($("#upd_qualityGoods_cultivate").val().length > 20) {
		showMessage("输入的竞品（养成）超过20个字符，请重新输入！");
		return false;
	}

	// 简评
	if ($("#upd_game_comment").val().length > 1500) {
		showMessage("输入的简评超过1500个字符，请重新输入！");
		return false;
	}

	// 特色
	if ($("#upd_feature").val().length > 100) {
		showMessage("输入的特色超过100个字符，请重新输入！");
		return false;
	}

	if ($('input:radio[name="upd_area"]:checked').val() == '国内') {
		$("#areaValue").val('国内');
	} else if ($('input:radio[name="upd_area"]:checked').val() == '海外') {
		$("#areaValue").val($('#upd_oversea').val());
	} else {
		$("#areaValue").val('');
	}

	document.getElementById("detailForm").action = "updateInfo.html";
	document.getElementById("detailForm").submit();
}

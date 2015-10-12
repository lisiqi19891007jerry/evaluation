function doUpateDataAction() {

	// 游戏名
	if ($("#in_game_name").val() == '') {
		showMessage("游戏名不能为空！");
		return false;
	} else if ($("#in_game_name").val().length > 20) {
		showMessage("输入的游戏名超过20个字符，请重新输入！");
		return false;
	}

	// 单机or网游
	if ($('input:radio[name="game_type"]:checked').val() == null) {
		showMessage("请选择单机or网游！");
		return false;
	}

	// 研发商
	if ($("#developName").val().length > 20) {
		showMessage("输入的研发商超过20个字符，请重新输入！");
		return false;
	}

	// 场景
	if ($('input:radio[name="scene"]:checked').val() == null) {
		showMessage("请选择场景类型！");
		return false;
	}

	// 人物
	if ($('input:radio[name="show_person_type"]:checked').val() == null) {
		showMessage("请选择人物类型！");
		return false;
	}

	// 发行商
	if ($("#sendName").val().length > 20) {
		showMessage("输入的发行商超过20个字符，请重新输入！");
		return false;
	}

	// 绘画
	if ($('input:radio[name="painting_style_1"]:checked').val() == null) {
		showMessage("请选择绘画类型！");
		return false;
	}

	// 风格
	if ($('input:radio[name="painting_style_2"]:checked').val() == null) {
		showMessage("请选择风格类型！");
		return false;
	}

	// 游戏类型
	if ($("#in_game_type").val() == '') {
		showMessage("游戏类型不能为空！");
		return false;
	} else if ($("#in_game_type").val().length > 20) {
		showMessage("输入的游戏类型超过20个字符，请重新输入！");
		return false;
	}

	var number_judge = /^\d+(\.\d+)?$/;

	// 游戏完成度
	var gameDegree = $('#gameDegree').val();

	if (gameDegree != '' && !number_judge.test(parseFloat(gameDegree))) {
		showMessage("请在游戏完成度输入0或正数！");
		return false;
	} else if (gameDegree != '' && parseFloat(gameDegree) > 100) {
		showMessage("请在游戏完成度输入0 ~ 100之间的数字！");
		return false;
	}

	// 游戏题材
	if ($("#in_game_theme").val() == '') {
		showMessage("游戏题材不能为空！");
		return false;
	} else if ($("#in_game_theme").val().length > 20) {
		showMessage("输入的游戏题材超过20个字符，请重新输入！");
		return false;
	}

	// 游戏玩法轻重度
	if ($('input:radio[name="playing_method"]:checked').val() == null) {
		showMessage("请选择游戏玩法轻重度类型！");
		return false;
	}

	// 是否IP授权
	if ($('input:radio[name="is_authorization"]:checked').val() == null) {
		showMessage("请选择是否IP授权！");
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

	// 平台
	if ($('input:radio[name="platform_type"]:checked').val() == null) {
		showMessage("请选择平台类型！");
		return false;
	}

	// 复测情况
	if ($('#retest_status').val() == null) {
		showMessage("请选择复测情况类型！");
		return false;
	}

	// 测评日期
	if ($('#evaluation_date').val() == '') {
		showMessage("请输入测评日期！");
		return false;
	}

	// 测评人
	if ($('#tester').val() == null) {
		showMessage("请选择测评人！");
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

	// 测评评级
	if ($('#evaluation_level').val() == null) {
		showMessage("请选择测评评级！");
		return false;
	}

	// 上线表现评价说明
	if ($("#manifestationExplain").val().length > 25) {
		showMessage("输入的上线表现评价说明超过25个字符，请重新输入！");
		return false;
	}

	// 参考竞品养成方面
	if ($("#qualityGoods_cultivate").val().length > 20) {
		showMessage("输入的参考竞品养成方面超过20个字符，请重新输入！");
		return false;
	}

	// 参考战斗养成方面
	if ($("#qualityGoods_combat").val().length > 20) {
		showMessage("输入的参考战斗养成方面超过20个字符，请重新输入！");
		return false;
	}

	// 删档
	if($("#record").is(':checked') == true) {
		$("#recordValue").val('1');
	} else {
		$("#recordValue").val('2');
	}

	// 付费
	if($("#openPay").is(':checked') == true) {
		$("#openPayValue").val('1');
	} else {
		$("#openPayValue").val('2');
	}

	document.getElementById("detailForm").action = "updateInfo.html";
	document.getElementById("detailForm").submit();
}

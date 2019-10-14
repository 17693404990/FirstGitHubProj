function del(id) {
	if (confirm("确定要删除吗")) {
		$.ajax({
			"url" : "news/delete",
			"data" : "id=" + id,
			"dataType" : "json",
			"type" : "get",
			"success" : function(data) {
				if (data > 0) {
					alert("删除成功");
					location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}
}
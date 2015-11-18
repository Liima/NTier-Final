$.widget("freetree.micropost",{
	options : {
		micropost : null,
		components : {
			parents: null,
			info: null,
			flags: null,
			content: null,
			comments: null,
			hashtags: null
		}
	},

	_create : function(){
		var c = this.options.components,
			m = this.options.micropost;
		this.element = $('<div>',{'id':micropost});
		c.parents = $('<div>').text('>>1, >>2, >>3').appendTo(this.element);
		c.info = $('<div>')
			.text('options, alias_name, timestamp, >>4')
			.appendTo(this.element);
		c.flags = $('<div>')
			.text('greenflag, redflag')
			.appendTo(this.element);
		c.content = $('<div>')
			.text('This is where the content of the micropost goes. hashtags, callouts, and parentlinks will also show up here.')
			.appendTo(this.element);
		c.comments = $('<div>')
			.text('>>5, >>6, >>7')
			.appendTo(this.element);
		c.hashtags = $('<div>')
			.text('#winning (3), #shrekt (1)')
			.appendTo(this.element);
	}
});

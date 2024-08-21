class Dream {
  String? id;
  String? charKey;
  String? word;
  String? wordDefinitionUrl;
  String? defParagraph;

  Dream(
      {this.id,
      this.charKey,
      this.word,
      this.wordDefinitionUrl,
      this.defParagraph});

  Dream.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    charKey = json['char_key'];
    word = json['word'];
    wordDefinitionUrl = json['word_definition_url'];
    defParagraph = json['def_paragraph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['char_key'] = this.charKey;
    data['word'] = this.word;
    data['word_definition_url'] = this.wordDefinitionUrl;
    data['def_paragraph'] = this.defParagraph;
    return data;
  }
}
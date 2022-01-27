const getLastPost = r'''
  query{
  posts(options: {
    sort: {
      field: "id",
      order: DESC
    }
  }){
    data {
      id
      title
    }
  }
}
''';

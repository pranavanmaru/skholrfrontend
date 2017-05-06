using System;
using Nest;
using System.Collections.Generic;

namespace SkholrApp
{
    public class ESConnect
    {
        public static Uri node;
        public static ConnectionSettings settings;
        public static ElasticClient client;

        public static List<string> Search(string query)
        {
            node = new Uri("https://search-skholr-vib3xbex4u3fm35sw65fezu5ga.us-east-1.es.amazonaws.com/");
            settings = new ConnectionSettings(node);
            settings.DefaultIndex("skholrcdn");
            client = new ElasticClient(settings);

            var descriptor = new CreateIndexDescriptor("skholrcdn")
                                .Mappings(ms => ms
                                .Map<Document>(m => m.AutoMap()));


            return PerformQuery(query);
        }

        public static List<string> PerformQuery(string query)
        {

            //var result = client.Search<Document>(d => d.Query(q=>q.MatchAll()));
            //String searchKey = "Big Tata";
            var request = new SearchRequest
            {
                From = 0,
                Size = 10,
                Query = new TermQuery { Field = "title", Value = $"{query}" }
                || new MatchQuery { Field = "content", Query = $"{query}" }
            };

            var result = client.Search<Document>(request).Documents;


            List<string> fileNames = new List<string>();
            foreach (var item in result)
            {
                fileNames.Add(item.Title);
            }

            return fileNames;
        }
    }
}
using MongoDB.Driver;

namespace TodoApi.Models
{
    public interface IGameContext
    {
        IMongoCollection<Game> Games { get; }
    }
}
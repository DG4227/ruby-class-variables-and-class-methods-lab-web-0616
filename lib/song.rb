require 'pry'
class Song

	attr_accessor :name, :artist, :genre

	@@count = 0
	@@artists = []
	@@genres = []
	@@artist_count = {}
	@@genre_count = {}
	@@all = []

	def self.all
		@@all
	end

	def self.count
		@@count
	end

	def self.artists
		@@artists.uniq
	end

	def self.genres
		@@genres.uniq
	end

	def self.genre_count
		@@genre_count
	end

	def self.artist_count
		@@artist_count
	end

	def initialize(name, artist, genre)
		@name = name
		@artist = artist
		@genre = genre

		@@genres << genre
		@@artists << artist
		@@all << self
		@@count += 1

		self.genre_histogram(self)
		self.artist_histogram(self)
	end

	def genre_histogram(song)
		copy_genres = @@genres.dup 
		@@genre_count = copy_genres.each_with_object({}) do |genre, hash|
			hash[genre] ||= hash[genre] = 0
			hash[genre] += 1
		end
	end

	def artist_histogram(song)
		copy_artists = @@artists.dup
		@@artist_count = copy_artists.each_with_object({}) do |artist, hash|
			hash[artist] ||= hash[artist] = 0
			hash[artist] += 1
		end
	end
end

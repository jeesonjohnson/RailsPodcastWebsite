
User.create!([
  {email: "admin@admin.com", password:"adminadmin",password_confirmation: "adminadmin", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "admin", last_name: "admin", description: "Hi, welcome to my profile, this is really cool website."},
  {email: "dwane@gmail.com", password:"dwanedwane",password_confirmation: "dwanedwane", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "dwane", last_name: "johnson", description: "My biscep is bigger than your house."},
  {email: "meila@gmail.com", password:"meilameila",password_confirmation: "meilameila", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "meila", last_name: "kunnis", description: "Im meg from family guy:)...Shut up meg."},
  {email: "elon@gmail.com", password:"elonelon",password_confirmation: "elonelon", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "elon", last_name: "Musk", description: "Making flamethrowers, and some other stuff."},
  {email: "mark@gmail.com", password:"markmark",password_confirmation: "markmark", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "Mark", last_name: "Zuckerberg", description: "I am watching you, watch me. Turn around."},
  {email: "george@gmail.com", password:"georgegeorge",password_confirmation: "georgegeorge", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "George", last_name: "Washington", description: "Don't speak to me unless you also founded a country."}
])

Friendship.create!([
  {user_id: 1, friend_id: 2},
  {user_id: 1, friend_id: 3},
  {user_id: 1, friend_id: 4},
  {user_id: 1, friend_id: 5},
  {user_id: 1, friend_id: 6}
])
Podcast.create!([
  {name: "The Joe Rogan Experience", author: "The Joe Rogan Experience", rsslink: "http://joeroganexp.joerogan.libsynpro.com/rss", image_url: "http://static.libsyn.com/p/assets/7/1/f/3/71f3014e14ef2722/JREiTunesImage2.jpg", itunes_id: "360084272"},
  {name: "Man In The Window: The Golden State Killer", author: "Man In The Window: The Golden State Killer", rsslink: "https://rss.art19.com/man-in-the-window", image_url: "https://content.production.cdn.art19.com/images/36/7d/69/27/367d6927-ff27-4a36-8140-c1a1af61886f/20646864b49d4c9b5e14a615ae7430ce3b71bbeca8039d12ecb0f95b6116d99197c864cd6071451713b7df9b66abae6cb788a63162846f88331aa6a5b194f844.jpeg", itunes_id: "1465334342"},
  {name: "Dirty John", author: "Dirty John", rsslink: "https://rss.art19.com/dirty-john", image_url: "https://content.production.cdn.art19.com/images/f5/cf/d8/37/f5cfd837-6c97-4422-a573-4ea06f2b2a13/92560badd97d72391e87a7f98ef308a82f3f8973b0ac04d558be398f1bb06c4d0b09e982e9f7d939e7a7be6f06470d4b2f015e2211d4c4a67c73378122690d54.jpeg", itunes_id: "1272970334"},
  {name: "The Dropout", author: "The Dropout", rsslink: "https://feeds.castfire.com/abc-news-radio/the_dropout", image_url: "https://serve.castfire.com/audio/3584615/3584615_2019-01-10-174615.jpg", itunes_id: "1449500734"},
  {name: "White Lies", author: "White Lies", rsslink: "https://www.npr.org/rss/podcast.php?id=510343", image_url: "https://media.npr.org/assets/img/2019/04/16/white-lies_final_sq-b1391789cfa7562bf3a4cd0c9cdae27fc4fa01b9.jpg?s=1400", itunes_id: "1462650519"},
  {name: "Snacks Daily", author: "Snacks Daily", rsslink: "http://feeds.feedburner.com/marketsnacks-daily", image_url: "https://megaphone-prod.s3.amazonaws.com/podcasts/6f5e0684-0f62-11e9-8892-c3999a92d94d/image/uploads_2F1572397783054-6o9dpywwwhw-d0dae8b553156c24ea5f76003bd5b130_2FSnacks%2BSquare%2BLogo.png", itunes_id: "1386234384"},
  {name: "This Land", author: "This Land", rsslink: "http://feeds.feedburner.com/this-land", image_url: "https://megaphone-prod.s3.amazonaws.com/podcasts/2d80a482-6e63-11e9-b5af-cf31ce84a8ce/image/uploads_2F1558448032018-9b7l6b8th6k-56a0f415860388837dce41415cc3ccac_2Fthis_land_final.jpg", itunes_id: "1464954218"},
  {name: "The Dave Ramsey Show", author: "The Dave Ramsey Show", rsslink: "http://daveramsey.ramsey.libsynpro.com/rss", image_url: "http://static.libsyn.com/p/assets/6/4/2/a/642adfd9d5543208/tdrs-libsyn.jpg", itunes_id: "77001367"},
  {name: "Dan Carlin's Hardcore History", author: "Dan Carlin's Hardcore History", rsslink: "http://feeds.feedburner.com/dancarlin/history?format=xml", image_url: "http://www.dancarlin.com/graphics/DC_HH_iTunes.jpg", itunes_id: "173001861"},
  {name: "Call Her Daddy", author: "Call Her Daddy", rsslink: "https://mcsorleys.barstoolsports.com/feed/call-her-daddy", image_url: "https://podcasts.barstoolsports.com/_images/call_her_daddy_itunes.e5b5d9abdc67.jpg", itunes_id: "1418960261"},
  {name: "Armchair Expert with Dax Shepard", author: "Armchair Expert with Dax Shepard", rsslink: "https://feeds.simplecast.com/qf4XXrnI", image_url: "https://cdn.simplecast.com/images/0f24bed7-a97a-44f9-acad-ae53dc40c90a/6ee076d3-c7b2-4425-906e-65814b120642/3000x3000/1517966385artwork.jpg?&aid=rss_feed", itunes_id: "1345682353"},
  {name: "Naval", author: "Naval", rsslink: "https://naval.libsyn.com/rss", image_url: "https://ssl-static.libsyn.com/p/assets/5/a/9/9/5a9912cac834097c/naval_podcast_itunes_-_b2.jpg", itunes_id: "1454097755"},
  {name: "Criminal", author: "Criminal", rsslink: "http://feeds.thisiscriminal.com/CriminalShow", image_url: "https://f.prxu.org/criminal/images/aaff5251-e6ab-44da-8886-092289630040/CRIMINAL_LOGOS_FINAL_wt_sq.png", itunes_id: "809264944"},
  {name: "Freakonomics Radio", author: "Freakonomics Radio", rsslink: "https://rss.art19.com/freakonomics-radio", image_url: "https://content.production.cdn.art19.com/images/01/73/7e/02/01737e02-609c-40c0-8cb1-6c010b5a170b/7300ad8b177115c141228ae24897bb5b828ba645232b5732ec43d9610a782138cd3d69d0c88f44559420c2ded82022e03600e57040740f1c7b42c93bfc06a675.jpeg", itunes_id: "354668519"},
  {name: "Planet Money", author: "Planet Money", rsslink: "https://www.npr.org/rss/podcast.php?id=510289", image_url: "https://media.npr.org/assets/img/2018/08/02/npr_planetmoney_podcasttile_sq-7b7fab0b52fd72826936c3dbe51cff94889797a0.jpg?s=1400", itunes_id: "290783428"},
  {name: "Tesla Daily: Tesla News & Analysis", author: "Tesla Daily: Tesla News & Analysis", rsslink: "http://techcastdaily.libsyn.com/rss", image_url: "http://static.libsyn.com/p/assets/c/6/3/8/c638db1e7ff7998a/Tesla_Daily_Logo_Small.jpg", itunes_id: "1273643094"},
  {name: "StarTalk Radio", author: "StarTalk Radio", rsslink: "https://rss.art19.com/startalk-radio", image_url: "https://content.production.cdn.art19.com/images/07/9d/d2/a3/079dd2a3-e834-4f94-b143-7cda92ee6173/e01eb3c25bd67e61fe22b9ecf609ffa58438f7a079216d7b27f99bf478f3b3d5d6e59192efeb0fef574c20ebb7b49539231a1475d4ce6554780eace09dbd026b.jpeg", itunes_id: "325404506"},
  {name: "Face 2 Face", author: "Face 2 Face", rsslink: "https://rss.whooshkaa.com/rss/podcast/id/3731", image_url: "https://files.whooshkaa.com/podcasts/podcast_3731/podcast_media/1003bb-Face_2_Face_1400x1400_Compressed.jpg", itunes_id: "1413107490"},
  {name: "Mad Money w/ Jim Cramer", author: "Mad Money w/ Jim Cramer", rsslink: "https://feeds.megaphone.fm/mad-money", image_url: "https://megaphone-prod.s3.amazonaws.com/podcasts/7b434cf4-b88e-11e9-ac3a-7b8336b78bca/image/03566bcaecc44a69ece283ad4d68262422e74df8bfcfc54355de1c5f4f6bced7ad2792a1538a7dba0afad878a4593222367d7b38d8cf59defcb869edfc3c9422.jpeg", itunes_id: "147247199"},
  {name: "I Spy", author: "I Spy", rsslink: "https://feeds.megaphone.fm/i-spy-foreign-policy", image_url: "https://megaphone-prod.s3.amazonaws.com/podcasts/6e1d8baa-e612-11e9-995b-4b46ae66c5e2/image/uploads_2F1573156484854-f14up5b2tqh-36aba37acae60f4ba24518ce23a2b6c1_2FiSpy_Logo_Podcast.png", itunes_id: "1482310665"},
  {name: "Patriots Unfiltered", author: "Patriots Unfiltered", rsslink: "https://nflpatriots.cachefly.net/content/patriots/production/pfw-in-progress-itunes.xml", image_url: "https://nflpatriots.cachefly.net/content/patriots/production/20190815160651-2019-PatriotsUnfiltered.jpeg", itunes_id: "187310910"},
  {name: "Business Wars", author: "Business Wars", rsslink: "https://rss.art19.com/business-wars", image_url: "https://content.production.cdn.art19.com/images/72/49/f7/a4/7249f7a4-163e-443e-9d0b-c4d2133eb36c/28ee9ab994e1d3017649f8beb239f7f01c4c677cd3dce26ccec4a27f8c066901c8de40be841fe20e91c8ec5b8713ae3fda343671b3dbf73b9bd537cee88d7988.jpeg", itunes_id: "1335814741"},
  {name: "The Big Buck Theory", author: "The Big Buck Theory", rsslink: "https://anchor.fm/s/83f35ec/podcast/rss", image_url: "https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded/1283603/1283603-1568070917183-ed525f38159df.jpg", itunes_id: "1447924959"}
])
UserPodcast.create!([
  {user_id: 1, podcast_id: 1},
  {user_id: 1, podcast_id: 2},
  {user_id: 1, podcast_id: 3},
  {user_id: 1, podcast_id: 4},
  {user_id: 1, podcast_id: 5},
  {user_id: 1, podcast_id: 6},
  {user_id: 2, podcast_id: 7},
  {user_id: 2, podcast_id: 1},
  {user_id: 2, podcast_id: 2},
  {user_id: 2, podcast_id: 8},
  {user_id: 2, podcast_id: 9},
  {user_id: 3, podcast_id: 10},
  {user_id: 3, podcast_id: 11},
  {user_id: 3, podcast_id: 12},
  {user_id: 3, podcast_id: 13},
  {user_id: 3, podcast_id: 5},
  {user_id: 3, podcast_id: 6},
  {user_id: 4, podcast_id: 4},
  {user_id: 4, podcast_id: 14},
  {user_id: 4, podcast_id: 15},
  {user_id: 4, podcast_id: 16},
  {user_id: 4, podcast_id: 17},
  {user_id: 5, podcast_id: 18},
  {user_id: 5, podcast_id: 19},
  {user_id: 5, podcast_id: 20},
  {user_id: 6, podcast_id: 15},
  {user_id: 6, podcast_id: 21},
  {user_id: 6, podcast_id: 22},
  {user_id: 6, podcast_id: 23}
])

import '../../domain/models/dhikr.dart';
import '../../domain/models/emotional_state.dart';
import '../../domain/models/special_occasion.dart';

class ArabicData {
  static final List<Dhikr> defaultAdhkar = [
    Dhikr(
      id: '1',
      arabicText: 'سبحان الله العظيم وبحمده',
      transliteration: 'Subhanallahil Azeem wa bihamdihi',
      translation: 'Glory be to Allah, the Almighty, and all praise is due to Him',
      source: 'Sahih Bukhari',
      recommendedCount: 33,
      category: 'general',
      hasAudio: true,
    ),
    Dhikr(
      id: '2',
      arabicText: 'لا إله إلا الله وحده لا شريك له',
      transliteration: 'La ilaha illallah wahdahu la sharika lah',
      translation: 'There is no god but Allah, alone, without partner',
      source: 'Sahih Muslim',
      recommendedCount: 100,
      category: 'general',
      hasAudio: true,
    ),
    Dhikr(
      id: '3',
      arabicText: 'سبحان الله والحمد لله والله أكبر',
      transliteration: 'Subhanallah walhamdulillah wallahu akbar',
      translation: 'Glory be to Allah, praise be to Allah, Allah is the Greatest',
      source: 'Sahih Bukhari',
      recommendedCount: 33,
      category: 'general',
      hasAudio: true,
    ),
    Dhikr(
      id: '4',
      arabicText: 'أستغفر الله وأتوب إليه',
      transliteration: 'Astaghfirullah wa atubu ilayh',
      translation: 'I seek forgiveness from Allah and repent to Him',
      source: 'Sahih Muslim',
      recommendedCount: 100,
      category: 'general',
      hasAudio: true,
    ),
    Dhikr(
      id: '5',
      arabicText: 'اللهم صل على محمد وعلى آل محمد',
      transliteration: 'Allahumma salli ala Muhammad wa ala ali Muhammad',
      translation: 'O Allah, send peace upon Muhammad and the family of Muhammad',
      source: 'Sahih Bukhari',
      recommendedCount: 50,
      category: 'general',
      hasAudio: true,
    ),
  ];

  static final List<Dhikr> morningAdhkar = [
    Dhikr(
      id: 'm1',
      arabicText: 'اللهم بك أصبحنا وبك أمسينا وبك نحيا وبك نموت وإليك المصير',
      transliteration: 'Allahumma bika asbahna wa bika amsayna wa bika nahya wa bika namootu wa ilaykal maseer',
      translation: 'O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die, and to You is the final return',
      source: 'Abu Dawud',
      recommendedCount: 1,
      category: 'morning',
      hasAudio: true,
    ),
    Dhikr(
      id: 'm2',
      arabicText: 'اللهم أنت ربي لا إله إلا أنت خلقتني وأنا عبدك',
      transliteration: 'Allahumma anta Rabbi la ilaha illa anta khalaqtani wa ana abduka',
      translation: 'O Allah, You are my Lord, none has the right to be worshipped but You, You created me and I am Your servant',
      source: 'Sahih Bukhari',
      recommendedCount: 1,
      category: 'morning',
      hasAudio: true,
    ),
  ];

  static final List<Dhikr> eveningAdhkar = [
    Dhikr(
      id: 'e1',
      arabicText: 'اللهم بك أمسينا وبك أصبحنا وبك نحيا وبك نموت وإليك النشور',
      transliteration: 'Allahumma bika amsayna wa bika asbahna wa bika nahya wa bika namootu wa ilaykan nushoor',
      translation: 'O Allah, by You we enter the evening and by You we enter the morning, by You we live and by You we die, and to You is the resurrection',
      source: 'Abu Dawud',
      recommendedCount: 1,
      category: 'evening',
      hasAudio: true,
    ),
  ];

  static final List<Dhikr> nightAdhkar = [
    Dhikr(
      id: 'n1',
      arabicText: 'باسمك اللهم أموت وأحيا',
      transliteration: 'Bismika Allahumma amootu wa ahya',
      translation: 'In Your name, O Allah, I die and I live',
      source: 'Sahih Bukhari',
      recommendedCount: 3,
      category: 'night',
      hasAudio: true,
    ),
  ];

  static final List<EmotionalState> emotionalStates = [
    EmotionalState(id: 'sad', emoji: '😔', label: 'حزين', recommendedDhikr: 'إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ', recommendedDua: 'اللهم أجرني في مصيبتي واخلف لي خيراً منها', quranicVerse: 'إِنَّ مَعَ الْعُسْرِ يُسْرًا'),
    EmotionalState(id: 'worried', emoji: '😟', label: 'مهموم', recommendedDhikr: 'حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم', recommendedDua: 'اللهم إني عبدك ابن عبدك ابن أمتك ناصيتي بيدك', quranicVerse: 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ'),
    EmotionalState(id: 'anxious', emoji: '😰', label: 'قلق', recommendedDhikr: 'لا إله إلا الله العظيم الحليم', recommendedDua: 'اللهم اكفني بحلالك عن حرامك وأغنني بفضلك عمن سواك', quranicVerse: 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ'),
    EmotionalState(id: 'angry', emoji: '😠', label: 'غاضب', recommendedDhikr: 'أعوذ بالله من الشيطان الرجيم', recommendedDua: 'اللهم اغفر لي ذنبي وذهب غيظ قلبي', quranicVerse: 'وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ'),
    EmotionalState(id: 'tired', emoji: '😴', label: 'متعب', recommendedDhikr: 'لا حول ولا قوة إلا بالله', recommendedDua: 'اللهم إني أسألك العافية في الدنيا والآخرة', quranicVerse: 'وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ'),
    EmotionalState(id: 'need_reassurance', emoji: '🤍', label: 'بحاجة إلى طمأنينة', recommendedDhikr: 'الله الله ربي لا أشرك به شيئاً', recommendedDua: 'اللهم أنت السلام ومنك السلام تباركت يا ذا الجلال والإكرام', quranicVerse: 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ'),
    EmotionalState(id: 'happy', emoji: '😊', label: 'فرحان', recommendedDhikr: 'الحمد لله الذي بنعمته تتم الصالحات', recommendedDua: 'اللهم لك الحمد كما ينبغي لجلال وجهك وعظيم سلطانك', quranicVerse: 'قُلْ بِفَضْلِ اللَّهِ وَبِرَحْمَتِهِ فَبِذَلِكَ فَلْيَفْرَحُوا'),
    EmotionalState(id: 'peaceful', emoji: '😌', label: 'مرتاح', recommendedDhikr: 'اللهم إني أسألك رضاك والجنة', recommendedDua: 'ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار', quranicVerse: 'يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ'),
    EmotionalState(id: 'stressed', emoji: '🤯', label: 'مضغوط', recommendedDhikr: 'لا إله إلا أنت سبحانك إني كنت من الظالمين', recommendedDua: 'اللهم لا سهل إلا ما جعلته سهلاً', quranicVerse: 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا * إِنَّ مَعَ الْعُسْرِ يُسْرًا'),
    EmotionalState(id: 'heartbroken', emoji: '💔', label: 'مجروح عاطفياً', recommendedDhikr: 'حسبنا الله ونعم الوكيل', recommendedDua: 'اللهم إني أسألك رحمة من عندك تهدي بها قلبي', quranicVerse: 'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ'),
    EmotionalState(id: 'lonely', emoji: '🌙', label: 'وحيد', recommendedDhikr: 'اللهم أنت الصاحب في السفر والخليفة في الأهل', recommendedDua: 'اللهم إني أسألك الأنس بقربك', quranicVerse: 'وَهُوَ مَعَكُمْ أَيْنَ مَا كُنْتُمْ'),
    EmotionalState(id: 'need_strength', emoji: '💪', label: 'محتاج قوة وصبر', recommendedDhikr: 'اللهم إني أسألك الصبر والقوة', recommendedDua: 'ربنا أفرغ علينا صبراً وثبت أقدامنا', quranicVerse: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ'),
    EmotionalState(id: 'seeking_guidance', emoji: '🕊️', label: 'أبحث عن الهداية', recommendedDhikr: 'اللهم اهدني وسددني', recommendedDua: 'اللهم إني أسألك الهدى والتقى والعفاف والغنى', quranicVerse: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ'),
  ];

  static final List<SpecialOccasion> specialOccasions = [
    SpecialOccasion(id: 'marriage', emoji: '💍', label: 'زواج', duas: ['بارك الله لك وبارك عليك وجمع بينكما في خير'], congratulationsMessage: 'بارك الله لكما وبارك عليكما وجمع بينكما في خير'),
    SpecialOccasion(id: 'birth', emoji: '👶', label: 'ولادة', duas: ['اللهم اجعله مباركاً واجعله من الصالحين'], congratulationsMessage: 'بارك الله لك في الموهوب وشكرت الواهب'),
    SpecialOccasion(id: 'circumcision', emoji: '✂️', label: 'طهور', duas: ['اللهم طهر قلبه واجعله من المتقين']),
    SpecialOccasion(id: 'sick', emoji: '🤒', label: 'مريض', duas: ['اللهم رب الناس أذهب البأس واشف أنت الشافي'], congratulationsMessage: 'لا بأس طهور إن شاء الله'),
    SpecialOccasion(id: 'death', emoji: '🕊️', label: 'وفاة وعزاء', duas: ['اللهم اغفر له وارحمه وعافه واعف عنه'], congratulationsMessage: 'إنا لله وإنا إليه راجعون'),
    SpecialOccasion(id: 'new_home', emoji: '🏡', label: 'منزل جديد', duas: ['اللهم بارك لهم في دارهم وارزقهم فيها الخير'], congratulationsMessage: 'بارك الله لك في المنزل الجديد'),
    SpecialOccasion(id: 'new_car', emoji: '🚗', label: 'سيارة جديدة', duas: ['اللهم إنا نسألك خيرها وخير ما جعلت لها'], congratulationsMessage: 'تبارك الله، جعله الله وسيلة خير لك'),
    SpecialOccasion(id: 'success', emoji: '🎓', label: 'نجاح', duas: ['اللهم زده علماً وارزقه النفع به'], congratulationsMessage: 'مبارك النجاح والتفوق'),
    SpecialOccasion(id: 'travel', emoji: '✈️', label: 'سفر', duas: ['اللهم هون علينا سفرنا هذا واطو عنا بعده'], congratulationsMessage: 'في حفظ الله ورعايته'),
    SpecialOccasion(id: 'new_job', emoji: '💼', label: 'عمل جديد', duas: ['اللهم ارزقه عملاً صالحاً وبارك له فيه'], congratulationsMessage: 'بارك الله لك في عملك الجديد'),
    SpecialOccasion(id: 'umrah_hajj', emoji: '🕋', label: 'عمرة أو حج', duas: ['اللهم تقبل حجته واعمر قلبه بالإيمان'], congratulationsMessage: 'حج مبرور وذنب مغفور'),
  ];
}

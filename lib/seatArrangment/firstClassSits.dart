class FirstClassSits{
   int sitNumber;
   bool isReserved;

  FirstClassSits(this.sitNumber, this.isReserved);
   static List<FirstClassSits> leftSits = [
     FirstClassSits(1,false),
     FirstClassSits(2,false),
     FirstClassSits(3,false),
     FirstClassSits(4,false),
     FirstClassSits(5,false),
     FirstClassSits(6,false),
     FirstClassSits(7,false),
     FirstClassSits(8,false),
     FirstClassSits(9,false),
     FirstClassSits(10,false),

   ];

   static List<FirstClassSits> rightSits = [
     FirstClassSits(11,false),
     FirstClassSits(12,false),
     FirstClassSits(13,false),
     FirstClassSits(14,false),
     FirstClassSits(15,false),
     FirstClassSits(16,false),
     FirstClassSits(17,false),
     FirstClassSits(18,false),
     FirstClassSits(19,false),
     FirstClassSits(20,false)
   ];
}

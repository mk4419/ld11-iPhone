# 迷路ゲームアプリ
- コードについて  
 迷路のコースは、配列を用いた０、１、２、３で幸世されており、特に０、１が多く用いられており間違いを起こしやすくなっている。  
 if文の代わりにSwitch文が用いられているので、使用方法が少し異なるので気をつける必要がいる。特に、最後に必ず `default` が必要になる。  
- テストについて  
 ジャイロ機能が使われているため、シュミレータではちゃんと動くかわからないそのため実機でのテストが必要になる。
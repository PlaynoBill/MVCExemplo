object DTMConexao: TDTMConexao
  OldCreateOrder = False
  Left = 795
  Top = 292
  Height = 280
  Width = 641
  object dbxConexao: TSQLConnection
    DriverName = 'DevartInterBase'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DbxDevartInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver190.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver190.bpl'
      'ProductName=DevartInterBase'
      'GetDriverFunc=getSQLDriverInterBase'
      'LibraryName=dbexpida40.dll'
      'VendorLib=gds32.dll'
      
        'Database=C:\Users\pleffer\Documents\MVCExemplo\DAO\VENDASTESTE.F' +
        'DB'
      'User_Name=sysdba'
      'Password=vdas1606'
      'SQLDialect=3'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommitted'
      'WaitOnLocks=True'
      'CharLength=1'
      'EnableBCD=True'
      'OptimizedNumerics=True'
      'LongStrings=True'
      'UseQuoteChar=False'
      'FetchAll=False'
      'DeferredBlobRead=False'
      'DeferredArrayRead=False'
      'UseUnicode=True'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Connected = True
    Left = 72
    Top = 33
  end
end

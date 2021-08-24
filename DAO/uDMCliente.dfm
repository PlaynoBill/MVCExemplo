object DMCliente: TDMCliente
  OldCreateOrder = False
  Left = 1301
  Top = 454
  Height = 310
  Width = 467
  object dsePesquisar: TSQLDataSet
    Active = True
    CommandText = 
      'SELECT ID_CLIENTE, CODIGO, RAZAO, TELEFONE'#13#10'FROM CLIENTES'#13#10'where' +
      ' (RAZAO like :razao)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'razao'
        ParamType = ptInput
      end>
    SQLConnection = DTMConexao.dbxConexao
    Left = 43
    Top = 30
  end
  object dseInserir: TSQLDataSet
    CommandText = 
      'insert into clientes (id_cliente, codigo, razao, fisicaoujuridic' +
      'a, cpfoucnpj, endereco, telefone)'#13#10'     values (:id_cliente, :co' +
      'digo, :razao, :fisicaoujuridica, :cpfoucnpj, :endereco, :telefon' +
      'e)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'razao'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fisicaoujuridica'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cpfoucnpj'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'endereco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefone'
        ParamType = ptInput
      end>
    SQLConnection = DTMConexao.dbxConexao
    Left = 105
    Top = 31
  end
  object dseAlterar: TSQLDataSet
    CommandText = 
      'update clientes'#13#10'set codigo = :codigo,'#13#10'    razao = :razao,'#13#10'   ' +
      ' fisicaoujuridica = :fisicaoujuridica,'#13#10'    cpfoucnpj = :cpfoucn' +
      'pj,'#13#10'    endereco = :endereco,'#13#10'    telefone = :telefone'#13#10'where ' +
      '(id_cliente = :id_cliente)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'razao'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fisicaoujuridica'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'cpfoucnpj'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'endereco'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'telefone'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end>
    SQLConnection = DTMConexao.dbxConexao
    Left = 177
    Top = 31
  end
  object dseExcluir: TSQLDataSet
    CommandText = 'delete from clientes'#13#10'where (id_cliente = :id_cliente)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end>
    SQLConnection = DTMConexao.dbxConexao
    Left = 242
    Top = 33
  end
  object dspPesquisar: TDataSetProvider
    DataSet = dsePesquisar
    Left = 37
    Top = 86
  end
  object cdsPesquisar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Name = 'razao'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 38
    Top = 149
    object cdsPesquisarID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object wdstrngfldPesquisarRAZAO: TWideStringField
      FieldName = 'RAZAO'
      FixedChar = True
      Size = 50
    end
    object wdstrngfldPesquisarTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      FixedChar = True
      Size = 12
    end
  end
end

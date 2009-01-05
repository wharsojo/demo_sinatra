#this need sinatra to have method in Object for 
# get
# post
# put
# delete
# ....... and others
#this need sequel to have method in String for 
# .pluralize 
# .singularize
def sinatra_crud rec
  model = rec.capitalize
  recs  = rec.pluralize

idxget = eval(<<END )
  proc do
    @#{recs} = #{model}.all 
    erb :"#{recs}/index"
  end
END

newget = eval(<<END )
  proc do
    @#{rec} = #{model}.new
    erb :"#{recs}/new"
  end
END

newpost= eval(<<END )
  proc do
    #{model} << params
    redirect "/#{recs}"
  end
END

edtget = eval(<<END )
  proc do
    id = params[:id]
    @#{rec} = #{model}[id]
    erb :"#{recs}/edit"
  end
END

edtput = eval(<<END )
  proc do
    id = params[:id]
    params.delete("_method")
    #{model}.filter(:id=>id).update(params)
    redirect "/#{recs}"
  end
END

edtdel = eval(<<END )
  proc do
    id = params[:id]
    #{model}.filter(:id=>id).delete
    redirect "/#{recs}"
  end
END

eval(<<END )
  class #{model} < Sequel::Model
  end
END
  
  get(   "/#{recs}"     ,&idxget )
  get(   "/#{recs}/new" ,&newget )
  post(  "/#{recs}/new" ,&newpost)
  get(   "/#{recs}/:id" ,&edtget )
  put(   "/#{recs}/:id" ,&edtput )
  delete("/#{recs}/:id" ,&edtdel )
end









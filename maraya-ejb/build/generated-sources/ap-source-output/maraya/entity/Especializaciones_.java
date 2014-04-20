package maraya.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Medicos;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(Especializaciones.class)
public class Especializaciones_ { 

    public static volatile SingularAttribute<Especializaciones, Integer> id;
    public static volatile CollectionAttribute<Especializaciones, Medicos> medicosCollection;
    public static volatile SingularAttribute<Especializaciones, String> especializacion;

}
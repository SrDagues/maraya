package maraya.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Medicos;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(UsuariosMedicos.class)
public class UsuariosMedicos_ { 

    public static volatile SingularAttribute<UsuariosMedicos, Integer> id;
    public static volatile SingularAttribute<UsuariosMedicos, Medicos> medico;
    public static volatile SingularAttribute<UsuariosMedicos, String> user;
    public static volatile SingularAttribute<UsuariosMedicos, String> password;

}
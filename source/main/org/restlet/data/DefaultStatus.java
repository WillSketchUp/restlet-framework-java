/*
 * Copyright 2005-2006 Jerome LOUVEL
 *
 * The contents of this file are subject to the terms
 * of the Common Development and Distribution License
 * (the "License").  You may not use this file except
 * in compliance with the License.
 *
 * You can obtain a copy of the license at
 * http://www.opensource.org/licenses/cddl1.txt
 * See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL
 * HEADER in each file and include the License file at
 * http://www.opensource.org/licenses/cddl1.txt
 * If applicable, add the following below this CDDL
 * HEADER, with the fields enclosed by brackets "[]"
 * replaced with your own identifying information:
 * Portions Copyright [yyyy] [name of copyright owner]
 */

package org.restlet.data;


/**
 * Status to return after handling a call.
 */
public class DefaultStatus implements Status
{
   /** The specification code. */
   private int code;

   /** The name of this REST element. */
   private String name;

   /** The description of this REST element. */
   private String description;

   /** The URI of the specification describing the method. */
   private String uri;

   /**
    * Constructor.
    * @param code The specification code.
    */
   public DefaultStatus(int code)
   {
      this(code, null, null, null);
   }

   /**
    * Constructor.
    * @param code The specification code.
    * @param name The name of this REST element.
    * @param description The description of this REST element.
    * @param uri The URI of the specification describing the method.
    */
   public DefaultStatus(int code, String name, String description, String uri)
   {
      this.code = code;
      this.name = name;
      this.description = description;
      this.uri = uri;
   }

   /**
    * Constructor.
    * @param status The status to copy.
    * @param description The description to associate.
    */
   public DefaultStatus(Status status, String description)
   {
      this(status.getHttpCode(), status.getName(), description, status.getUri());
   }

   /**
    * Returns the HTTP code.
    * @return The HTTP code.
    */
   public int getHttpCode()
   {
      return code;
   }

   /**
    * Returns the name of this REST element.
    * @return The name of this REST element.
    */
   public String getName()
   {
      return (name == null) ? Statuses.getName(getHttpCode()) : name;
   }

   /**
    * Returns the description.
    * @return The description.
    */
   public String getDescription()
   {
      return (description == null) ? Statuses.getDescription(getHttpCode()) : description;
   }

   /**
    * Sets the description.
    * @param description The description.
    */
   public void setDescription(String description)
   {
      this.description = description;
   }

   /**
    * Returns the URI of the specification describing the status.
    * @return The URI of the specification describing the status.
    */
   public String getUri()
   {
      return (uri == null) ? Statuses.getUri(getHttpCode()) : uri;
   }

   /**
    * Indicates if the status is an information status.
    * @return True if the status is an information status.
    */
   public boolean isInfo()
   {
      return Statuses.isInfo(getHttpCode());
   }

   /**
    * Indicates if the status is a success status.
    * @return True if the status is a success status.
    */
   public boolean isSuccess()
   {
      return Statuses.isSuccess(getHttpCode());
   }

   /**
    * Indicates if the status is a redirection status.
    * @return True if the status is a redirection status.
    */
   public boolean isRedirection()
   {
      return Statuses.isRedirection(getHttpCode());
   }

   /**
    * Indicates if the status is a client error status.
    * @return True if the status is a client error status.
    */
   public boolean isClientError()
   {
      return Statuses.isClientError(getHttpCode());
   }

   /**
    * Indicates if the status is a server error status.
    * @return True if the status is a server error status.
    */
   public boolean isServerError()
   {
      return Statuses.isServerError(getHttpCode());
   }

   /**
    * Indicates if the status is an error (client or server) status.
    * @return True if the status is an error (client or server) status.
    */
   public boolean isError()
   {
      return Statuses.isError(getHttpCode());
   }

   /**
    * Indicates if the method is equal to a given one.
    * @param status The status to compare to.
    * @return True if the status is equal to a given one.
    */
   public boolean equals(Status status)
   {
      return getHttpCode() == status.getHttpCode();
   }

   /**
    * Returns the name of the status followed by its HTTP code.
    * @return The name of the status followed by its HTTP code.
    */
   public String toString()
   {
   	return Statuses.toString(getHttpCode());
   }
   
}

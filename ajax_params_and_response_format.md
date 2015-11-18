# Users

### users#create
* create a new User
* parameters
    * ``` javascript
			{
				email : str,
				password: str,
				password_confirmation: str
			}
	  ```
* response
    * ``` javascript
		{
			status : 'success'
		}
		//or
		{
			status: 'failure',
			alert: str
		}
	  ```

### users/#destroy
* disable the user account of the current_user
* parameters
    * ``` javascript
			{
				password: str
			}
	  ```
* response
    * ``` javascript
		{
			status : 'success'
		}
		//or
		{
			status: 'failure',
			alert: str
		}
	  ```

### users/:alias_id#index
* shows all posts by a particular alias, given by the alias_id
* parameters
    * ``` javascript
			{
				alias_id: int
			}
	  ```
* response
    * ``` javascript
			{
				alias: {
					id: int,
					name: str
				}
				microposts: [{
					id: int,
					created_at: datetime,
					parents : [parent.id,...],
					content : text,
					hashtags: [{
						name: str,
						count: int
						},...],
					//only returns a finite number of comments
					//if comment_count is greater than that number, "view all comments" link appears
					comment_count: int,
					comments: [comment.id,...]
					},...]
			}
	  ```

### user/:alias_name#index
* shows all posts by a particular alias, given by the alias_name
* parameters
    * ``` javascript
			{
				alias_name: str
			}
      ```
* response
    * ``` javascript
			{
				alias: {
					id: int,
					name: str
				}
				microposts: [{
					id: int,
					created_at: datetime,
					parents : [parent.id,...],
					content : text,
					hashtags: [{
						name: str,
						count: int
						},...],
					//only returns a finite number of comments
					//if comment_count is greater than that number, "view all comments" link appears
					comment_count: int,
					comments: [comment.id,...]
					},...]
			}
	  ```

# Aliases

### alias#create
* create a new alias for the current_user if it hasn't been taken
* parameters
    * ``` javascript
		{
			alias_name: str
		}
	  ```
* response
    * ``` javascript
		{
			status : 'success'
		}
		//or
		{
			status: 'failure',
			alert: 'str'
		}
	  ```

### alias#index
* get all aliases for the current_user
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
		{
		  aliases: [{
		    alias_id : int,
		    alias: 'alias1'
		  },...]
		}
	  ```

### alias/:id#destroy
* disable an alias if it belongs to the current_user
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
	{
		status : 'success'
	}
	//or
	{
		status: 'failure',
		alert: 'str'
	}
	  ```

### alias/:id#block
* current_user blocks all microposts by the alias specified by its id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
	{
		status : 'success'
	}
	//or
	{
		status: 'failure',
		alert: 'str'
	}
	  ```

### alias/:alias_name#block
 * current_user blocks all microposts by the alias specified by its alias_name
 * parameters
    * ``` javascript
  			{}
  	  ```
 * response
    * ``` javascript
  	{
  		status : 'success'
  	}
  	//or
  	{
  		status: 'failure',
  		alert: 'str'
  	}
  	  ```

# Sessions

### sessions#create
* create a session for a User if authentication is successful
* parameters
    * ``` javascript
			{
				email: str,
				password: str
			}
	  ```
* response
    * ``` javascript
	{
		status : 'success'
	}
	//or
	{
		status: 'failure',
		alert: 'str'
	}
	  ```

### sessions#destroy
* log out of the current_user session
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
	{
		status : 'success'
	}
	//or
	{
		status: 'failure',
		alert: 'str'
	}
	  ```

# Microposts

### microposts#create
* create a micropost by the current_user
* parameters
    * ``` javascript
			{
				alias_id: int,
				parents: [parent.micropost_id,...],
				recipients: [recipient.alias_name,...],
				content: text,
				hashtags: [hashtag_name,...]
			}
	  ```
* response
    * ``` javascript
	{
		status : 'success'
	}
	//or
	{
		status: 'failure',
		alert: 'str'
	}
	  ```

### microposts/:id#show
* get a single micropost given by its id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
	{
		id: int,
		alias_name: str,
		created_at: datetime,
		parents : [parent.id,...],
		content : text,
		hashtags: [{
			name: str,
			count: int
			},...],
		//only returns a finite number of comments
		//if comment_count is greater than that number, "view all comments" link appears
		comment_count: int,
		comments: [comment.id,...]
	}		
	  ```

### microposts#index
* get all the microposts published by the current_user
* parameters
    * ``` javascript
			{
				//filter by alias
				alias_name: str,(optional)
				alias_id:str (optional)
			}
	  ```
* response
    * ``` javascript
			{
				microposts: [{
					id: int,
					alias_name: str,
					created_at: datetime,
					parents : [parent.id,...],
					content : text,
					hashtags: [{
						name: str,
						count: int
						},...],
					//only returns a finite number of comments
					//if comment_count is greater than that number, "view all comments" link appears
					comment_count: int,
					comments: [comment.id,...]
					},...]
			}
	  ```

### microposts/:id#comment
* assign a micropost as the comment of the micropost specified by its id
    * this action is performed during microposts#create if the new micropost is specified as a comment
* parameters
    * ``` javascript
			{
				micropost_id: int
			}
	  ```
* response
    * ``` javascript
			{}
	  ```

### microposts/:id/hashtags#create
* assign a hashtag to the micropost specified by its id
    * this action is performed during microposts#create if the new micropost contains a hashtag string
	* if the new micropost has only a comment specifier and a hashtag, then the hashtag is appended to the parent micropost
* parameters
    * ``` javascript
			{
				hashtag_name: str
			}
	  ```
* response
    * ``` javascript
			{}
	  ```

### microposts/:id/hashtags#index
* get all of the hashtags associated with the micropost specified by its id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{
				micropost_id: int,
				hashtags: [{
					name: str,
					count: int
					},...]
			}
	  ```

# Flags

### flags/:micropost_id#update
* change the current_user's flag states of the micropost specified by its micropost_id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### flags#index
* get all of the microposts with active flags for the current_user
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

# Messages

### messages/:alias_id#create
* assign a micropost as a message to an alias given by its alias_id
    * this action is only performed during microposts#create if the new micropost contains a callout string
	* when this action is called, the recipient will have the new micropost flagged with the unread message flag
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### messages#index
* get all messages sent to the current_user
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

# Subscriptions

### subscriptions/user/:alias_id#create
* subscribe the current_user to posts created under an alias specified by its alias_id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### subscriptions/user/:alias_name#create
* subscribe the current_user to posts created under an alias specified by its alias_name
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### subscriptions/:hashtag#create
* subscribe the current_user to posts appended with the hashtag specified by :hashtag
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### subscriptions/user/:alias_id#destroy
* unsubscribe the current_user to posts created under an alias specified by its alias_id
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### subscriptions/user/:alias_name#destroy
* unsubscribe the current_user to posts created under an alias specified by its alias_name
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

### subscriptions/:hashtag#destroy
* unsubscribe the current_user to posts appended with the hashtag specified by :hashtag
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

# Miscellaneous

### feed
* get the micropost feed for the current_user
    * the feed is the collection of recent posts made by subscribed aliases and tagged with subscribed hashtags
* parameters
    * ``` javascript
			{}
	  ```
* response
    * ``` javascript
			{}
	  ```

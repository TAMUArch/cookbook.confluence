confluence Cookbook
===================
This cookbook downloads, installs and does a very basic setup of Atlassian Confluence.

WARNING: This cookbook no longer includes java.  You need to include the java recipe
in your runlist before calling the confluence default recipe otherwise confluence
will fail to start.

Requirements
------------

#### cookbooks
- `ark` - `https://github.com/opscode-cookbooks/ark.git`
- `postgresql` - Official database cookbook from opscode

Attributes
----------

#### confluence::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['confluence']['user']</tt></td>
    <td>String</td>
    <td>user to run confluence as</td>
    <td><tt>confluence</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['group']</tt></td>
    <td>String</td>
    <td>group to run confluence as</td>
    <td><tt>confluence</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['install_dir']</tt></td>
    <td>String</td>
    <td>base directory to put confluence app directory</td>
    <td><tt>/opt</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['home_directory']</tt></td>
    <td>String</td>
    <td>confluence home directory</td>
    <td><tt>/var/confluence</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['version']</tt></td>
    <td>String</td>
    <td>confluence version to install</td>
    <td><tt>5.8.14</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['download_url']</tt></td>
    <td>String</td>
    <td>default url to download package from</td>
    <td><tt>http://www.atlassian.com/software/confluence/downloads/binary/</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['https_proxy']</tt></td>
    <td>Boolean</td>
    <td>whether to use a proxy</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['proxy']['name']</tt></td>
    <td>String</td>
    <td>name on proxy</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['proxy']['port']</tt></td>
    <td>Integer</td>
    <td>proxy port</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>
    <td><tt>['confluence']['proxy']['scheme']</tt></td>
    <td>String</td>
    <td>scheme for proxy</td>
    <td><tt>https</tt></td>
  </tr>
</table>

Usage
-----
#### confluence::default

Just include `confluence` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[confluence]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:

* Jim Rosser
* Victoria Blessing

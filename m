Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F3705FB0
	for <lists+linux-audit@lfdr.de>; Wed, 17 May 2023 08:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684303204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Gfb0RmHsy1dvBL9Pb+QWywgfhoEbFftP3bLctce97Gg=;
	b=IePfYuNdKWIibHIesFMQqeYJX3byDmwa4sdLYomNZcAgd24/aFaDeyVFy/uUAJkjTfLqKG
	GhBDzGF+ngJv6pT76qnGpabfxl015dIxWBcgd39D1WPmrR2fpozOqxeODs153qRdhk392D
	xc+GvXdw9mrLwba3IexMX049vVcfUqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-NDz3ZdxPOlO7fqDfSKlatg-1; Wed, 17 May 2023 02:00:00 -0400
X-MC-Unique: NDz3ZdxPOlO7fqDfSKlatg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19AF61C08791;
	Wed, 17 May 2023 05:59:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3CEE14171C0;
	Wed, 17 May 2023 05:59:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 278C419465B6;
	Wed, 17 May 2023 05:59:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C649D19465A4 for <linux-audit@listman.corp.redhat.com>;
 Wed, 17 May 2023 05:59:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B36B740C206F; Wed, 17 May 2023 05:59:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB0B040C2063
 for <linux-audit@redhat.com>; Wed, 17 May 2023 05:59:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 894623C025AD
 for <linux-audit@redhat.com>; Wed, 17 May 2023 05:59:50 +0000 (UTC)
Received: from mail.s4software.com (mail.s4software.com [54.213.93.65]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-HDZ-6QGRP_G7Fl1jf1yc9w-1; Wed, 17 May 2023 01:59:48 -0400
X-MC-Unique: HDZ-6QGRP_G7Fl1jf1yc9w-1
Received: from [192.168.1.4] (unknown [47.153.223.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.s4software.com (Postfix) with ESMTPSA id 98232453AEB
 for <Linux-audit@redhat.com>; Tue, 16 May 2023 22:59:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.s4software.com 98232453AEB
Message-ID: <4d904cad-814b-c62c-0bb1-3d05630e7305@s4software.com>
Date: Tue, 16 May 2023 22:59:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: What STIG audit rule picks up type=SOFTWARE_UPDATE events?
To: Linux-audit@redhat.com
References: <7622dda18a1544c3bb52052019e34d72@jhuapl.edu>
 <CAAepc6X3Opzz7amSMAUSFGKZnkrBCvi8qA0STYe3ySOEAzvL1Q@mail.gmail.com>
 <e61e9b19-cccd-2717-7291-fdbd524c97ef@s4software.com> <5677897.DvuYhMxLoT@x2>
From: Claire Stafford <cstafford@s4software.com>
In-Reply-To: <5677897.DvuYhMxLoT@x2>
X-Spam-Status: No, score=-3.7 required=5.0 tests=ALL_TRUSTED,HTML_MESSAGE,
 NICE_REPLY_A,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.0 URIBL_DBL_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
 *      dbl.spamhaus.org was blocked due to usage of an open resolver. See
 *      https://www.spamhaus.org/returnc/pub/
 *      [URIs: jhuapl.edu]
 *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 *       See http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 *      for more information. *      [URIs: s4software.com]
 *  0.0 URIBL_ZEN_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
 *      zen.spamhaus.org was blocked due to usage of an open resolver. See
 *      https://www.spamhaus.org/returnc/pub/
 *      [URIs: www.s4software.com]
 *  0.0 HTML_MESSAGE BODY: HTML included in message
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 * -2.7 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on s4aws.s4software.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: s4software.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============4782728791666839117=="

This is a multi-part message in MIME format.
--===============4782728791666839117==
Content-Type: multipart/alternative;
 boundary="------------XUqYv0pz130YjeVtXQvtbFyk"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------XUqYv0pz130YjeVtXQvtbFyk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thank you,

For some reason I had the idea that there were other software related=20
events - no wonder I couldn't find them!=C2=A0 Really they ought to at leas=
t=20
indicate if the install is a new or upgraded package, also when packages=20
get deleted.


On 5/16/23 21:12, Steve Grubb wrote:
> Hello,
>
> On Sunday, May 14, 2023 8:24:47 PM EDT Claire Stafford wrote:
>> This brings up the question of where I can find the audit events which
>> are generated by rpm?
> ausearch --start today -m SOFTWARE_UPDATE
>
>> Also dnf/yum if they directly generate events?
> No, they are linked against librpm. It in turn has a plugin, rpm-plugin-
> audit, which generates the audit events.
>
>> A very quick scan of the rpm source code doesn't reveal anything.
> https://github.com/rpm-software-management/rpm/blob/master/plugins/audit.=
c
>
> -Steve
>
>> On 5/14/23 14:46, Steven Grubb wrote:
>>> Hello,
>>>
>>>
>>> On Fri, May 12, 2023 at 5:23=E2=80=AFPM Wieprecht, Karen M.
>>>
>>> <Karen.Wieprecht@jhuapl.edu>  wrote:
>>>      All,
>>>     =20
>>>      Do you happen to know which if the standard STIG rules is picking
>>>      up   type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 ?
>>>
>>> None. rpm has been altered to produce these much the same as pam
>>> produces login events. It was too tricky to tell the intent to update
>>> vs querying the rpm database. And you have no way to answer the
>>> question about success without originating from inside rpm itself. I
>>> don't think any external rules can meet all requirements imposed by
>>> OSPP, which the STIG audit rules are loosely based on.
>>>
>>> -Steve
>>>
>>>        I=E2=80=99m trying to figure out if we missed one of these rules=
 on an
>>>      Ubuntu 20 system we are configuring  or if maybe the audit
>>>      subsystem implementation on that system doesn=E2=80=99t pick up al=
l of the
>>>      same record types as we get on our RHEL boxes. I realized when I
>>>      started looking at this that it=E2=80=99s not easy to determine wh=
ich
>>>      audit rule is picking up a particular event if it=E2=80=99s not on=
e of the
>>>      rule that has a key associated with it.
>>>     =20
>>>      As a possible alternative,   I ran across a sample audit.rules
>>>       list here GitHub - Neo23x0/auditd: Best Practice Auditd
>>>      Configuration<https://github.com/Neo23x0/auditd>   (actual rules
>>>      file is here: auditd/audit.rules at master =C2=B7 Neo23x0/auditd =
=C2=B7
>>>      GitHub
>>>      <https://github.com/Neo23x0/auditd/blob/master/audit.rules>) which
>>>      included some software management rules that don=E2=80=99t appear =
to be
>>>       part of the standard =E2=80=9C30-stig.rules=E2=80=9D .
>>>     =20
>>>      If the standard STIG rules don=E2=80=99t pick up  type=3DSOFTWARE_=
UPDATE
>>>      events on Ubuntu20,  I might add some of these , so I was hoping
>>>      to have a quick sanity check on whether these look like
>>>      appropriate alternatives.  Any recommendations or comments
>>>      regarding these sample rules would be much appreciated.  Basically
>>>      it looks to me like they are just setting watches for anyone
>>>       executing these various commands, which shouldn=E2=80=99t cause t=
o much
>>>      noise in the logs except maybe when we are patching which is one
>>>      of the continuous monitoring items I  need to be able to confirm.
>>>     =20
>>>      Thanks much!
>>>     =20
>>>      Karen Wieprecht
>>>     =20
>>>      # Software Management
>>>      ---------------------------------------------------------
>>>     =20
>>>      # RPM (Redhat/CentOS)
>>>     =20
>>>      -w /usr/bin/rpm -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/yum -p x -k software_mgmt
>>>     =20
>>>      # DNF (Fedora/RedHat 8/CentOS 8)
>>>     =20
>>>      -w /usr/bin/dnf -p x -k software_mgmt
>>>     =20
>>>      # YAST/Zypper/RPM (SuSE)
>>>     =20
>>>      -w /sbin/yast -p x -k software_mgmt
>>>     =20
>>>      -w /sbin/yast2 -p x -k software_mgmt
>>>     =20
>>>      -w /bin/rpm -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/zypper -k software_mgmt
>>>     =20
>>>      # DPKG / APT-GET (Debian/Ubuntu)
>>>     =20
>>>      -w /usr/bin/dpkg -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/apt -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/apt-add-repository -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/apt-get -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/aptitude -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/wajig -p x -k software_mgmt
>>>     =20
>>>      -w /usr/bin/snap -p x -k software_mgmt
>>>     =20
>>>      # PIP(3) (Python installs)
>>>     =20
>>>      -w /usr/bin/pip -p x -k T1072_third_party_software
>>>     =20
>>>      -w /usr/local/bin/pip -p x -k T1072_third_party_software
>>>     =20
>>>      -w /usr/bin/pip3 -p x -k T1072_third_party_software
>>>     =20
>>>      -w /usr/local/bin/pip3 -p x -k T1072_third_party_software
>>>     =20
>>>      # npm
>>>     =20
>>>      ## T1072 third party software
>>>     =20
>>>      ##https://www.npmjs.com
>>>     =20
>>>      ##https://docs.npmjs.com/cli/v6/commands/npm-audit
>>>     =20
>>>      -w /usr/bin/npm -p x -k T1072_third_party_software
>>>     =20
>>>      --
>>>      Linux-audit mailing list
>>>      Linux-audit@redhat.com
>>>      https://listman.redhat.com/mailman/listinfo/linux-audit
>>>
>>> --
>>> Linux-audit mailing list
>>> Linux-audit@redhat.com
>>> https://listman.redhat.com/mailman/listinfo/linux-audit
>
>
--=20
/Claire Stafford/
S4Software, Inc.
+1-619-736-9040
www.s4software.com
--------------XUqYv0pz130YjeVtXQvtbFyk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Thank you,</p>
    <p>For some reason I had the idea that there were other software
      related events - no wonder I couldn't find them!=C2=A0 Really they
      ought to at least indicate if the install is a new or upgraded
      package, also when packages get deleted.</p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/16/23 21:12, Steve Grubb wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:5677897.DvuYhMxLoT@x2">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hello,

On Sunday, May 14, 2023 8:24:47 PM EDT Claire Stafford wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">This brings up the question =
of where I can find the audit events which
are generated by rpm?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
ausearch --start today -m SOFTWARE_UPDATE

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Also dnf/yum if they directl=
y generate events?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
No, they are linked against librpm. It in turn has a plugin, rpm-plugin-
audit, which generates the audit events.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">A very quick scan of the rpm=
 source code doesn't reveal anything.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rpm-software-=
management/rpm/blob/master/plugins/audit.c">https://github.com/rpm-software=
-management/rpm/blob/master/plugins/audit.c</a>

-Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 5/14/23 14:46, Steven Gru=
bb wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Hello,


On Fri, May 12, 2023 at 5:23=E2=80=AFPM Wieprecht, Karen M.

<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Karen.Wieprecht@jhuapl.ed=
u">&lt;Karen.Wieprecht@jhuapl.edu&gt;</a> wrote:
    All,
   =20
    Do you happen to know which if the standard STIG rules is picking
    up   type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 ?

None. rpm has been altered to produce these much the same as pam
produces login events. It was too tricky to tell the intent to update
vs querying the rpm database. And you have no way to answer the
question about success without originating from inside rpm itself. I
don't think any external rules can meet all requirements imposed by
OSPP, which the STIG audit rules are loosely based on.

-Steve

      I=E2=80=99m trying to figure out if we missed one of these rules on a=
n
    Ubuntu 20 system we are configuring  or if maybe the audit
    subsystem implementation on that system doesn=E2=80=99t pick up all of =
the
    same record types as we get on our RHEL boxes. I realized when I
    started looking at this that it=E2=80=99s not easy to determine which
    audit rule is picking up a particular event if it=E2=80=99s not one of =
the
    rule that has a key associated with it.
   =20
    As a possible alternative,   I ran across a sample audit.rules
     list here GitHub - Neo23x0/auditd: Best Practice Auditd
    Configuration <a class=3D"moz-txt-link-rfc2396E" href=3D"https://github=
.com/Neo23x0/auditd">&lt;https://github.com/Neo23x0/auditd&gt;</a>  (actual=
 rules
    file is here: auditd/audit.rules at master =C2=B7 Neo23x0/auditd =C2=B7
    GitHub
    <a class=3D"moz-txt-link-rfc2396E" href=3D"https://github.com/Neo23x0/a=
uditd/blob/master/audit.rules">&lt;https://github.com/Neo23x0/auditd/blob/m=
aster/audit.rules&gt;</a>) which
    included some software management rules that don=E2=80=99t appear to be
     part of the standard =E2=80=9C30-stig.rules=E2=80=9D .
   =20
    If the standard STIG rules don=E2=80=99t pick up  type=3DSOFTWARE_UPDAT=
E
    events on Ubuntu20,  I might add some of these , so I was hoping
    to have a quick sanity check on whether these look like
    appropriate alternatives.  Any recommendations or comments
    regarding these sample rules would be much appreciated.  Basically
    it looks to me like they are just setting watches for anyone
     executing these various commands, which shouldn=E2=80=99t cause to muc=
h
    noise in the logs except maybe when we are patching which is one
    of the continuous monitoring items I  need to be able to confirm.
   =20
    Thanks much!
   =20
    Karen Wieprecht
   =20
    # Software Management
    ---------------------------------------------------------
   =20
    # RPM (Redhat/CentOS)
   =20
    -w /usr/bin/rpm -p x -k software_mgmt
   =20
    -w /usr/bin/yum -p x -k software_mgmt
   =20
    # DNF (Fedora/RedHat 8/CentOS 8)
   =20
    -w /usr/bin/dnf -p x -k software_mgmt
   =20
    # YAST/Zypper/RPM (SuSE)
   =20
    -w /sbin/yast -p x -k software_mgmt
   =20
    -w /sbin/yast2 -p x -k software_mgmt
   =20
    -w /bin/rpm -p x -k software_mgmt
   =20
    -w /usr/bin/zypper -k software_mgmt
   =20
    # DPKG / APT-GET (Debian/Ubuntu)
   =20
    -w /usr/bin/dpkg -p x -k software_mgmt
   =20
    -w /usr/bin/apt -p x -k software_mgmt
   =20
    -w /usr/bin/apt-add-repository -p x -k software_mgmt
   =20
    -w /usr/bin/apt-get -p x -k software_mgmt
   =20
    -w /usr/bin/aptitude -p x -k software_mgmt
   =20
    -w /usr/bin/wajig -p x -k software_mgmt
   =20
    -w /usr/bin/snap -p x -k software_mgmt
   =20
    # PIP(3) (Python installs)
   =20
    -w /usr/bin/pip -p x -k T1072_third_party_software
   =20
    -w /usr/local/bin/pip -p x -k T1072_third_party_software
   =20
    -w /usr/bin/pip3 -p x -k T1072_third_party_software
   =20
    -w /usr/local/bin/pip3 -p x -k T1072_third_party_software
   =20
    # npm
   =20
    ## T1072 third party software
   =20
    ## <a class=3D"moz-txt-link-freetext" href=3D"https://www.npmjs.com">ht=
tps://www.npmjs.com</a>
   =20
    ## <a class=3D"moz-txt-link-freetext" href=3D"https://docs.npmjs.com/cl=
i/v6/commands/npm-audit">https://docs.npmjs.com/cli/v6/commands/npm-audit</=
a>
   =20
    -w /usr/bin/npm -p x -k T1072_third_party_software
   =20
    --
    Linux-audit mailing list
    <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Linux-audit@redhat=
.com">Linux-audit@redhat.com</a>
    <a class=3D"moz-txt-link-freetext" href=3D"https://listman.redhat.com/m=
ailman/listinfo/linux-audit">https://listman.redhat.com/mailman/listinfo/li=
nux-audit</a>

--
Linux-audit mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Linux-audit@redhat.com=
">Linux-audit@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://listman.redhat.com/mailm=
an/listinfo/linux-audit">https://listman.redhat.com/mailman/listinfo/linux-=
audit</a>
</pre>
        </blockquote>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      <span style=3D"font-size:1.2em;font-family:verdana"><i>Claire
          Stafford</i></span><br>
      <span style=3D"font-size:1em">S4Software, Inc.<br>
        +1-619-736-9040<br>
        <a class=3D"moz-txt-link-abbreviated" href=3D"http://www.s4software=
.com">www.s4software.com</a></span></div>
  </body>
</html>

--------------XUqYv0pz130YjeVtXQvtbFyk--

--===============4782728791666839117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4782728791666839117==--


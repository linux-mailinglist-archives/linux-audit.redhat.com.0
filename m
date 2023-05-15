Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DA7020CB
	for <lists+linux-audit@lfdr.de>; Mon, 15 May 2023 02:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684110725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ijn13Q7755eqgge5qGLxkSYwTdFCRYGMzllwjTXqKvE=;
	b=ehyGmji/uXa8YXra54pz5f2MWUbo8lpTAgwJwZ7IKbZkluzx9ovUxcGOz69vQfb+QLxpBy
	BFEfB6DVoVwNjDzd+NM/OlyBpO/wdh+UZUujUqPCYpe4gJnCautDp5Nz0eiVIuADHDjK1g
	TSYDupiJthfQST+giS1X6nud7UZxmio=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-f63tKGqJMTi-kiprg-nhtw-1; Sun, 14 May 2023 20:32:01 -0400
X-MC-Unique: f63tKGqJMTi-kiprg-nhtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A2B1C07552;
	Mon, 15 May 2023 00:31:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33E661410F23;
	Mon, 15 May 2023 00:31:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D33AE19465A8;
	Mon, 15 May 2023 00:31:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F837194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 15 May 2023 00:31:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 73759140E917; Mon, 15 May 2023 00:31:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B4191401C51
 for <linux-audit@redhat.com>; Mon, 15 May 2023 00:31:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC1785A588
 for <linux-audit@redhat.com>; Mon, 15 May 2023 00:31:52 +0000 (UTC)
Received: from mail.s4software.com (mail.s4software.com [54.213.93.65]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-_LGEbSzLOx6u8NWM2mYf7A-1; Sun, 14 May 2023 20:31:49 -0400
X-MC-Unique: _LGEbSzLOx6u8NWM2mYf7A-1
Received: from [192.168.1.4] (unknown [47.145.5.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.s4software.com (Postfix) with ESMTPSA id 662A44149B3
 for <Linux-audit@redhat.com>; Sun, 14 May 2023 17:24:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.s4software.com 662A44149B3
Message-ID: <e61e9b19-cccd-2717-7291-fdbd524c97ef@s4software.com>
Date: Sun, 14 May 2023 17:24:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: What STIG audit rule picks up type=SOFTWARE_UPDATE events?
To: Linux-audit@redhat.com
References: <7622dda18a1544c3bb52052019e34d72@jhuapl.edu>
 <CAAepc6X3Opzz7amSMAUSFGKZnkrBCvi8qA0STYe3ySOEAzvL1Q@mail.gmail.com>
From: Claire Stafford <cstafford@s4software.com>
In-Reply-To: <CAAepc6X3Opzz7amSMAUSFGKZnkrBCvi8qA0STYe3ySOEAzvL1Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=ALL_TRUSTED,HTML_MESSAGE,
 NICE_REPLY_A,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.0 URIBL_DBL_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
 *      dbl.spamhaus.org was blocked due to usage of an open resolver. See
 *      https://www.spamhaus.org/returnc/pub/
 *      [URIs: jhuapl.edu]
 *  0.0 URIBL_ZEN_BLOCKED_OPENDNS ADMINISTRATOR NOTICE: The query to
 *      zen.spamhaus.org was blocked due to usage of an open resolver. See
 *      https://www.spamhaus.org/returnc/pub/
 *      [URIs: www.s4software.com]
 *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 *       See http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 *      for more information. *      [URIs: jhuapl.edu]
 *  0.0 HTML_MESSAGE BODY: HTML included in message
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 * -0.9 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on s4aws.s4software.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Content-Type: multipart/mixed; boundary="===============6937560855372674388=="

This is a multi-part message in MIME format.
--===============6937560855372674388==
Content-Type: multipart/alternative;
 boundary="------------D9leUmUnckr4hSuuewkxtdFt"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D9leUmUnckr4hSuuewkxtdFt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

This brings up the question of where I can find the audit events which=20
are generated by rpm?=C2=A0 Also dnf/yum if they directly generate events?=
=C2=A0 A=20
very quick scan of the rpm source code doesn't reveal anything.

Thanks,

Claire Stafford
S4Software, Inc.

On 5/14/23 14:46, Steven Grubb wrote:
> Hello,
>
>
> On Fri, May 12, 2023 at 5:23=E2=80=AFPM Wieprecht, Karen M.=20
> <Karen.Wieprecht@jhuapl.edu> wrote:
>
>     All,
>
>     Do you happen to know which if the standard STIG rules is picking
>     up =C2=A0=C2=A0type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 ?
>
>
> None. rpm has been altered to produce these much the same as pam=20
> produces login events. It was too tricky to tell the intent to update=20
> vs querying the rpm database. And you have no way to answer the=20
> question about success without originating from inside rpm itself. I=20
> don't think any external rules can meet all requirements imposed by=20
> OSPP, which the STIG audit rules are loosely based on.
>
> -Steve
>
>     =C2=A0 I=E2=80=99m trying to figure out if we missed one of these rul=
es on an
>     Ubuntu 20 system we are configuring=C2=A0 or if maybe the audit
>     subsystem implementation on that system doesn=E2=80=99t pick up all o=
f the
>     same record types as we get on our RHEL boxes. I realized when I
>     started looking at this that it=E2=80=99s not easy to determine which
>     audit rule is picking up a particular event if it=E2=80=99s not one o=
f the
>     rule that has a key associated with it.
>
>     As a possible alternative,=C2=A0=C2=A0 I ran across a sample audit.ru=
les
>     =C2=A0list here GitHub - Neo23x0/auditd: Best Practice Auditd
>     Configuration <https://github.com/Neo23x0/auditd> =C2=A0(actual rules
>     file is here: auditd/audit.rules at master =C2=B7 Neo23x0/auditd =C2=
=B7
>     GitHub
>     <https://github.com/Neo23x0/auditd/blob/master/audit.rules>) which
>     included some software management rules that don=E2=80=99t appear to =
be
>     =C2=A0part of the standard =E2=80=9C30-stig.rules=E2=80=9D .
>
>     If the standard STIG rules don=E2=80=99t pick up =C2=A0type=3DSOFTWAR=
E_UPDATE
>     events on Ubuntu20, =C2=A0I might add some of these , so I was hoping
>     to have a quick sanity check on whether these look like
>     appropriate alternatives.=C2=A0 Any recommendations or comments
>     regarding these sample rules would be much appreciated.=C2=A0 Basical=
ly
>     it looks to me like they are just setting watches for anyone
>     =C2=A0executing these various commands, which shouldn=E2=80=99t cause=
 to much
>     noise in the logs except maybe when we are patching which is one
>     of the continuous monitoring items I =C2=A0need to be able to confirm=
.
>
>     Thanks much!
>
>     Karen Wieprecht
>
>     # Software Management
>     ---------------------------------------------------------
>
>     # RPM (Redhat/CentOS)
>
>     -w /usr/bin/rpm -p x -k software_mgmt
>
>     -w /usr/bin/yum -p x -k software_mgmt
>
>     # DNF (Fedora/RedHat 8/CentOS 8)
>
>     -w /usr/bin/dnf -p x -k software_mgmt
>
>     # YAST/Zypper/RPM (SuSE)
>
>     -w /sbin/yast -p x -k software_mgmt
>
>     -w /sbin/yast2 -p x -k software_mgmt
>
>     -w /bin/rpm -p x -k software_mgmt
>
>     -w /usr/bin/zypper -k software_mgmt
>
>     # DPKG / APT-GET (Debian/Ubuntu)
>
>     -w /usr/bin/dpkg -p x -k software_mgmt
>
>     -w /usr/bin/apt -p x -k software_mgmt
>
>     -w /usr/bin/apt-add-repository -p x -k software_mgmt
>
>     -w /usr/bin/apt-get -p x -k software_mgmt
>
>     -w /usr/bin/aptitude -p x -k software_mgmt
>
>     -w /usr/bin/wajig -p x -k software_mgmt
>
>     -w /usr/bin/snap -p x -k software_mgmt
>
>     # PIP(3) (Python installs)
>
>     -w /usr/bin/pip -p x -k T1072_third_party_software
>
>     -w /usr/local/bin/pip -p x -k T1072_third_party_software
>
>     -w /usr/bin/pip3 -p x -k T1072_third_party_software
>
>     -w /usr/local/bin/pip3 -p x -k T1072_third_party_software
>
>     # npm
>
>     ## T1072 third party software
>
>     ## https://www.npmjs.com
>
>     ## https://docs.npmjs.com/cli/v6/commands/npm-audit
>
>     -w /usr/bin/npm -p x -k T1072_third_party_software
>
>     --
>     Linux-audit mailing list
>     Linux-audit@redhat.com
>     https://listman.redhat.com/mailman/listinfo/linux-audit
>
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
--=20
/Claire Stafford/
S4Software, Inc.
+1-619-736-9040
www.s4software.com
--------------D9leUmUnckr4hSuuewkxtdFt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi,</p>
    <p>This brings up the question of where I can find the audit events
      which are generated by rpm?=C2=A0 Also dnf/yum if they directly
      generate events?=C2=A0 A very quick scan of the rpm source code doesn=
't
      reveal anything.</p>
    <p>Thanks,<br>
    </p>
    <p>Claire Stafford<br>
      S4Software, Inc.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/14/23 14:46, Steven Grubb wrote:<br=
>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAAepc6X3Opzz7amSMAUSFGKZnkrBCvi8qA0STYe3ySOEAzvL1Q@mail.gmail.=
com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">Hello,
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 12, 2023 at
            5:23=E2=80=AFPM Wieprecht, Karen M. &lt;<a
              href=3D"mailto:Karen.Wieprecht@jhuapl.edu"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Kare=
n.Wieprecht@jhuapl.edu</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div class=3D"msg3360991086530130866">
              <div lang=3D"EN-US">
                <div class=3D"m_3360991086530130866WordSection1">
                  <p class=3D"MsoNormal">All,=C2=A0 </p>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <p class=3D"MsoNormal">Do you happen to know which if
                    the standard STIG rules is picking up
                    =C2=A0=C2=A0type=3DSOFTWARE_UPDATE events on RHEL 7 and=
 8 ?=C2=A0</p>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div>None. rpm has been altered to produce these much the
              same as pam produces login events. It was too tricky to
              tell the intent to update vs querying the rpm database.
              And you have no way to answer the question about success
              without originating from inside rpm itself. I don't think
              any external rules can meet all requirements imposed by
              OSPP, which the STIG audit rules are loosely based on.<br>
            </div>
            <div><br>
            </div>
            <div>-Steve</div>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div class=3D"msg3360991086530130866">
              <div lang=3D"EN-US">
                <div class=3D"m_3360991086530130866WordSection1">
                  <p class=3D"MsoNormal">=C2=A0 I=E2=80=99m trying to figur=
e out if we
                    missed one of these rules on an Ubuntu 20 system we
                    are configuring=C2=A0 or if maybe the audit subsystem
                    implementation on that system doesn=E2=80=99t pick up a=
ll of
                    the same record types as we get on our RHEL boxes.=C2=
=A0
                    I realized when I started looking at this that it=E2=80=
=99s
                    not easy to determine which audit rule is picking up
                    a particular event if it=E2=80=99s not one of the rule =
that
                    has a key associated with it.=C2=A0 =C2=A0=C2=A0</p>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <p class=3D"MsoNormal">As a possible alternative,=C2=A0=
=C2=A0 I
                    ran across a sample audit.rules =C2=A0list here
                    <a href=3D"https://github.com/Neo23x0/auditd"
                      target=3D"_blank" moz-do-not-send=3D"true">GitHub -
                      Neo23x0/auditd: Best Practice Auditd Configuration</a=
>
                    =C2=A0(actual rules file is here:
                    <a
                      href=3D"https://github.com/Neo23x0/auditd/blob/master=
/audit.rules"
                      target=3D"_blank" moz-do-not-send=3D"true">auditd/aud=
it.rules
                      at master =C2=B7 Neo23x0/auditd =C2=B7 GitHub</a>) wh=
ich
                    included some software management rules that don=E2=80=
=99t
                    appear to be =C2=A0part of the standard =E2=80=9C30-sti=
g.rules=E2=80=9D
                    .=C2=A0=C2=A0=C2=A0
                  </p>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <p class=3D"MsoNormal">If the standard STIG rules don=E2=
=80=99t
                    pick up =C2=A0type=3DSOFTWARE_UPDATE events on Ubuntu20=
, =C2=A0I
                    might add some of these , so I was hoping to have a
                    quick sanity check on whether these look like
                    appropriate alternatives.=C2=A0 Any recommendations or
                    comments regarding these sample rules would be much
                    appreciated.=C2=A0 Basically it looks to me like they a=
re
                    just setting watches for anyone =C2=A0executing these
                    various commands, which shouldn=E2=80=99t cause to much
                    noise in the logs except maybe when we are patching
                    which is one of the continuous monitoring items I
                    =C2=A0need to be able to confirm.=C2=A0 =C2=A0=C2=A0</p=
>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <p class=3D"MsoNormal">Thanks much!</p>
                  <p class=3D"MsoNormal">Karen Wieprecht </p>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># Software Management
---------------------------------------------------------</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># RPM (Redhat/CentOS)</s=
pan></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/rpm -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/yum -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># DNF (Fedora/RedHat
                      8/CentOS 8)</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/dnf -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># YAST/Zypper/RPM
                      (SuSE)</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /sbin/yast -p x -k
                      software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /sbin/yast2 -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /bin/rpm -p x -k
                      software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/zypper -k
                      software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># DPKG / APT-GET
                      (Debian/Ubuntu)</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/dpkg -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/apt -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w
                      /usr/bin/apt-add-repository -p x -k software_mgmt</sp=
an></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/apt-get
                      -p x -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/aptitude
                      -p x -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/wajig -p
                      x -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/snap -p x
                      -k software_mgmt</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># PIP(3) (Python
                      installs)</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/pip -p x
                      -k T1072_third_party_software</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/local/bin/pip
                      -p x -k T1072_third_party_software</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/pip3 -p x
                      -k T1072_third_party_software</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w
                      /usr/local/bin/pip3 -p x -k
                      T1072_third_party_software</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">=C2=A0</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in"># npm</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">## T1072 third party
                      software</span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">## <a
                        href=3D"https://www.npmjs.com" target=3D"_blank"
                        moz-do-not-send=3D"true"
                        class=3D"moz-txt-link-freetext">https://www.npmjs.c=
om</a></span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">## <a
                        href=3D"https://docs.npmjs.com/cli/v6/commands/npm-=
audit"
                        target=3D"_blank" moz-do-not-send=3D"true"
                        class=3D"moz-txt-link-freetext">https://docs.npmjs.=
com/cli/v6/commands/npm-audit</a></span></p>
                  <p class=3D"MsoNormal"><span
                      style=3D"font-size:9pt;font-family:Consolas;color:rgb=
(31,35,40);border:1pt
                      none windowtext;padding:0in">-w /usr/bin/npm -p x
                      -k T1072_third_party_software</span></p>
                </div>
              </div>
              --<br>
              Linux-audit mailing list<br>
              <a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Li=
nux-audit@redhat.com</a><br>
              <a
                href=3D"https://listman.redhat.com/mailman/listinfo/linux-a=
udit"
                rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
                class=3D"moz-txt-link-freetext">https://listman.redhat.com/=
mailman/listinfo/linux-audit</a><br>
            </div>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">--
Linux-audit mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Linux-audit@redhat.com=
">Linux-audit@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://listman.redhat.com/mailm=
an/listinfo/linux-audit">https://listman.redhat.com/mailman/listinfo/linux-=
audit</a>
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

--------------D9leUmUnckr4hSuuewkxtdFt--

--===============6937560855372674388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6937560855372674388==--


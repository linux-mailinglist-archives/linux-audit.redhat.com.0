Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28694701FF9
	for <lists+linux-audit@lfdr.de>; Sun, 14 May 2023 23:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684100733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PL2KacC/QqQ0QNsoqyVHzZwgewgkkPK9qBJXR/ZEXmo=;
	b=dwKcEvDegGq9STsVVjkiL2aDeVgpCLIjG/hNc7vhfNrND4aJcbJjOK4DzrT0oqewskna8W
	SamJyFU2eCQqITWMfIH6Qr1UAICL44Td4yS2uKAfU12Cw4QkqWTtTiB9y0dfA/sIIRXdjl
	UA+ibEvzmBME64EGxN3GKm+bAd9OSBQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-8D1Kmf71NxWeFSz4AJ2K7w-1; Sun, 14 May 2023 17:45:28 -0400
X-MC-Unique: 8D1Kmf71NxWeFSz4AJ2K7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C802B380673B;
	Sun, 14 May 2023 21:45:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06978400F5A;
	Sun, 14 May 2023 21:45:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0236919465A8;
	Sun, 14 May 2023 21:45:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC568194658C for <linux-audit@listman.corp.redhat.com>;
 Sun, 14 May 2023 21:45:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 762792166B2A; Sun, 14 May 2023 21:45:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C49B2166B26
 for <linux-audit@redhat.com>; Sun, 14 May 2023 21:45:06 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B12B38173C2
 for <linux-audit@redhat.com>; Sun, 14 May 2023 21:45:06 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-pI37JugBM2uFLAE7G4P48A-1; Sun, 14 May 2023 17:45:04 -0400
X-MC-Unique: pI37JugBM2uFLAE7G4P48A-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bcc3ee913so10569296a12.2
 for <Linux-audit@redhat.com>; Sun, 14 May 2023 14:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684100703; x=1686692703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1EvAoeEuUW/IEG/0glGdetpC1AgSaNpubiPb52gmYI=;
 b=csFa+smAUmse8XNc3IcQCnVi/ePWXhSA2sV82kVz6lQw2e5UGbLdATtnj0SxJZHxHS
 tvxbys6ZUu7aYdniEvXrz9i3OyFAQN3V0+LSfCmAr2dwhXMYehv1TGXicjrErHkLff0a
 eFTE8dtWXBYUf4XzgsNREjusHJy5+IrhNpwwbFcM0WlOGUQ8nlavDIHB3rYCI4r97h2l
 yOwnDms98wKMVtXZ4l7vRf1jP5jDvaXPZduUTBgCBPxFMrpxhrRxNgSFh05+X4qbhJ2B
 5xv2NxNzFj0M2S5+WLbnMtB9vXiHq7VRiWYSeBgvrS7olAxOFvzH8KuHh4zLssIqJ7Rm
 yJ1w==
X-Gm-Message-State: AC+VfDw9sOigP+JceBSisv8OSaAoc//Dzy0ot4hmBbkwdP8v8FC8Oa2Q
 szQn/Qc9GCfUC9SGmmcKFNY61txzUYUInJxeLmzDUrMeVLRv9asYcKX3SdGo016DamKApT+tQ/t
 Kez3DOwgsqynDaLQZMA5nexXPZ+8XPQCz048=
X-Received: by 2002:a05:6402:641:b0:50c:161b:9152 with SMTP id
 u1-20020a056402064100b0050c161b9152mr24157840edx.13.1684100703127; 
 Sun, 14 May 2023 14:45:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ545FJ0epmxMO1ZCzRLunU6vGE4vaQi9sNrVbofouwnYeIVE1+ox1Db+xmd3OWa2GXX6RWNil2dUA0N+FzfCUk=
X-Received: by 2002:a05:6402:641:b0:50c:161b:9152 with SMTP id
 u1-20020a056402064100b0050c161b9152mr24157830edx.13.1684100702788; Sun, 14
 May 2023 14:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <7622dda18a1544c3bb52052019e34d72@jhuapl.edu>
In-Reply-To: <7622dda18a1544c3bb52052019e34d72@jhuapl.edu>
From: Steven Grubb <sgrubb@redhat.com>
Date: Sun, 14 May 2023 17:46:01 -0400
Message-ID: <CAAepc6X3Opzz7amSMAUSFGKZnkrBCvi8qA0STYe3ySOEAzvL1Q@mail.gmail.com>
Subject: Re: What STIG audit rule picks up type=SOFTWARE_UPDATE events?
To: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8040778346056975489=="

--===============8040778346056975489==
Content-Type: multipart/alternative; boundary="00000000000027fa8b05fbae40a6"

--00000000000027fa8b05fbae40a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,


On Fri, May 12, 2023 at 5:23=E2=80=AFPM Wieprecht, Karen M. <
Karen.Wieprecht@jhuapl.edu> wrote:

> All,
>
>
>
> Do you happen to know which if the standard STIG rules is picking up
>   type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 ?
>

None. rpm has been altered to produce these much the same as pam produces
login events. It was too tricky to tell the intent to update vs querying
the rpm database. And you have no way to answer the question about success
without originating from inside rpm itself. I don't think any external
rules can meet all requirements imposed by OSPP, which the STIG audit rules
are loosely based on.

-Steve


>   I=E2=80=99m trying to figure out if we missed one of these rules on an =
Ubuntu 20
> system we are configuring  or if maybe the audit subsystem implementation
> on that system doesn=E2=80=99t pick up all of the same record types as we=
 get on
> our RHEL boxes.  I realized when I started looking at this that it=E2=80=
=99s not
> easy to determine which audit rule is picking up a particular event if it=
=E2=80=99s
> not one of the rule that has a key associated with it.
>
>
>
> As a possible alternative,   I ran across a sample audit.rules  list here=
 GitHub
> - Neo23x0/auditd: Best Practice Auditd Configuration
> <https://github.com/Neo23x0/auditd>  (actual rules file is here: auditd/a=
udit.rules
> at master =C2=B7 Neo23x0/auditd =C2=B7 GitHub
> <https://github.com/Neo23x0/auditd/blob/master/audit.rules>) which
> included some software management rules that don=E2=80=99t appear to be  =
part of
> the standard =E2=80=9C30-stig.rules=E2=80=9D .
>
>
>
> If the standard STIG rules don=E2=80=99t pick up  type=3DSOFTWARE_UPDATE =
events on
> Ubuntu20,  I might add some of these , so I was hoping to have a quick
> sanity check on whether these look like appropriate alternatives.  Any
> recommendations or comments regarding these sample rules would be much
> appreciated.  Basically it looks to me like they are just setting watches
> for anyone  executing these various commands, which shouldn=E2=80=99t cau=
se to much
> noise in the logs except maybe when we are patching which is one of the
> continuous monitoring items I  need to be able to confirm.
>
>
>
> Thanks much!
>
> Karen Wieprecht
>
>
>
> # Software Management
> ---------------------------------------------------------
>
>
>
> # RPM (Redhat/CentOS)
>
> -w /usr/bin/rpm -p x -k software_mgmt
>
> -w /usr/bin/yum -p x -k software_mgmt
>
>
>
> # DNF (Fedora/RedHat 8/CentOS 8)
>
> -w /usr/bin/dnf -p x -k software_mgmt
>
>
>
> # YAST/Zypper/RPM (SuSE)
>
> -w /sbin/yast -p x -k software_mgmt
>
> -w /sbin/yast2 -p x -k software_mgmt
>
> -w /bin/rpm -p x -k software_mgmt
>
> -w /usr/bin/zypper -k software_mgmt
>
>
>
> # DPKG / APT-GET (Debian/Ubuntu)
>
> -w /usr/bin/dpkg -p x -k software_mgmt
>
> -w /usr/bin/apt -p x -k software_mgmt
>
> -w /usr/bin/apt-add-repository -p x -k software_mgmt
>
> -w /usr/bin/apt-get -p x -k software_mgmt
>
> -w /usr/bin/aptitude -p x -k software_mgmt
>
> -w /usr/bin/wajig -p x -k software_mgmt
>
> -w /usr/bin/snap -p x -k software_mgmt
>
>
>
> # PIP(3) (Python installs)
>
> -w /usr/bin/pip -p x -k T1072_third_party_software
>
> -w /usr/local/bin/pip -p x -k T1072_third_party_software
>
> -w /usr/bin/pip3 -p x -k T1072_third_party_software
>
> -w /usr/local/bin/pip3 -p x -k T1072_third_party_software
>
>
>
> # npm
>
> ## T1072 third party software
>
> ## https://www.npmjs.com
>
> ## https://docs.npmjs.com/cli/v6/commands/npm-audit
>
> -w /usr/bin/npm -p x -k T1072_third_party_software
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
>

--00000000000027fa8b05fbae40a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div dir=3D"ltr"><br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 12, 2023 at 5:23=E2=
=80=AFPM Wieprecht, Karen M. &lt;<a href=3D"mailto:Karen.Wieprecht@jhuapl.e=
du">Karen.Wieprecht@jhuapl.edu</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div class=3D"msg3360991086530130866">





<div lang=3D"EN-US">
<div class=3D"m_3360991086530130866WordSection1">
<p class=3D"MsoNormal">All,=C2=A0 <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Do you happen to know which if the standard STIG rul=
es is picking up =C2=A0=C2=A0type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 =
?=C2=A0</p></div></div></div></blockquote><div><br></div><div><div>None. rp=
m has been altered to produce these much the same as pam=20
produces login events. It was too tricky to tell the intent to update vs
 querying the rpm database. And you have no way to answer the question=20
about success without originating from inside rpm itself. I don&#39;t think=
=20
any external rules can meet all requirements imposed by OSPP, which the=20
STIG audit rules are loosely based on.<br></div><div><br></div><div>-Steve<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div class=3D"msg3360991086530130866"><div lang=3D"EN-US"><div class=3D"=
m_3360991086530130866WordSection1"><p class=3D"MsoNormal">=C2=A0 I=E2=80=99=
m trying to figure out if we missed one of these rules on an Ubuntu 20 syst=
em we are configuring=C2=A0 or if maybe the audit
 subsystem implementation on that system doesn=E2=80=99t pick up all of the=
 same record types as we get on our RHEL boxes.=C2=A0 I realized when I sta=
rted looking at this that it=E2=80=99s not easy to determine which audit ru=
le is picking up a particular event if it=E2=80=99s not one of
 the rule that has a key associated with it.=C2=A0 =C2=A0=C2=A0<u></u><u></=
u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">As a possible alternative,=C2=A0=C2=A0 I ran across =
a sample audit.rules =C2=A0list here
<a href=3D"https://github.com/Neo23x0/auditd" target=3D"_blank">GitHub - Ne=
o23x0/auditd: Best Practice Auditd Configuration</a> =C2=A0(actual rules fi=
le is here:
<a href=3D"https://github.com/Neo23x0/auditd/blob/master/audit.rules" targe=
t=3D"_blank">auditd/audit.rules at master =C2=B7 Neo23x0/auditd =C2=B7 GitH=
ub</a>) which included some software management rules that don=E2=80=99t ap=
pear to be =C2=A0part of the standard =E2=80=9C30-stig.rules=E2=80=9D .=C2=
=A0=C2=A0=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If the standard STIG rules don=E2=80=99t pick up =C2=
=A0type=3DSOFTWARE_UPDATE events on Ubuntu20, =C2=A0I might add some of the=
se , so I was hoping to have a quick sanity check on whether these look lik=
e appropriate alternatives.=C2=A0 Any recommendations or comments
 regarding these sample rules would be much appreciated.=C2=A0 Basically it=
 looks to me like they are just setting watches for anyone =C2=A0executing =
these various commands, which shouldn=E2=80=99t cause to much noise in the =
logs except maybe when we are patching which is one
 of the continuous monitoring items I =C2=A0need to be able to confirm.=C2=
=A0 =C2=A0=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks much!<u></u><u></u></p>
<p class=3D"MsoNormal">Karen Wieprecht <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># Software Manage=
ment ---------------------------------------------------------<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># RPM (Redhat/Cen=
tOS)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/rpm -=
p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/yum -=
p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># DNF (Fedora/Red=
Hat 8/CentOS 8)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/dnf -=
p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># YAST/Zypper/RPM=
 (SuSE)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /sbin/yast -p =
x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /sbin/yast2 -p=
 x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /bin/rpm -p x =
-k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/zyppe=
r -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># DPKG / APT-GET =
(Debian/Ubuntu)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/dpkg =
-p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/apt -=
p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/apt-a=
dd-repository -p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/apt-g=
et -p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/aptit=
ude -p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/wajig=
 -p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/snap =
-p x -k software_mgmt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># PIP(3) (Python =
installs)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/pip -=
p x -k T1072_third_party_software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/local/bin=
/pip -p x -k T1072_third_party_software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/pip3 =
-p x -k T1072_third_party_software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/local/bin=
/pip3 -p x -k T1072_third_party_software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in"># npm<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">## T1072 third pa=
rty software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">## <a href=3D"htt=
ps://www.npmjs.com" target=3D"_blank">https://www.npmjs.com</a><u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">## <a href=3D"htt=
ps://docs.npmjs.com/cli/v6/commands/npm-audit" target=3D"_blank">https://do=
cs.npmjs.com/cli/v6/commands/npm-audit</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Consolas;co=
lor:rgb(31,35,40);border:1pt none windowtext;padding:0in">-w /usr/bin/npm -=
p x -k T1072_third_party_software</span><u></u><u></u></p>
</div>
</div>

--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit" rel=3D"=
noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/l=
inux-audit</a><br>
</div></blockquote></div></div>

--00000000000027fa8b05fbae40a6--

--===============8040778346056975489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8040778346056975489==--


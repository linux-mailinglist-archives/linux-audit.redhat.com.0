Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D727E6FE1E2
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 17:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683733890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2AQSCNzeZactH3ipc8dLMHH5CLhVnqmsSBM+Ldi0KQ8=;
	b=HC2z9dA95IDQ/NoGvwnIJi+L6ba9M85p2V3U8HIXqDxJxa5Pnu5B/iaIFSXdAlivwIVFIg
	CgjAsewEEZfvQbcsXqbYoalOT1JjDc0xl362sXrCUApLnjNA99Ab95yeHJXU5k7ua7CHTb
	BhhO6hC2tfCHM733ZLcTa3Ffx0bZVT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-JQyaB4DEM1yZZqQDYpKQbA-1; Wed, 10 May 2023 11:51:28 -0400
X-MC-Unique: JQyaB4DEM1yZZqQDYpKQbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5055C805F58;
	Wed, 10 May 2023 15:51:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE18E63F86;
	Wed, 10 May 2023 15:51:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91F2019451C5;
	Wed, 10 May 2023 15:51:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 854F819452C6 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 15:51:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75D7C40C2078; Wed, 10 May 2023 15:51:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D72840C2077
 for <linux-audit@redhat.com>; Wed, 10 May 2023 15:51:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FF90280AA23
 for <linux-audit@redhat.com>; Wed, 10 May 2023 15:51:18 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-vXJjQ9tqNJC0j3sdoDXxnw-1; Wed, 10 May 2023 11:51:15 -0400
X-MC-Unique: vXJjQ9tqNJC0j3sdoDXxnw-1
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so13188192a12.0
 for <linux-audit@redhat.com>; Wed, 10 May 2023 08:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733874; x=1686325874;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxDrZO6fFdFdoS8ERlAZSC3ao8lOdErWCGJcKRDHVrg=;
 b=UORJClNT+YXJ3euK3o5RJf/EnEL0eGN6pUloVLSPcLLfXAviXG9hKzOqea7kzN0N9K
 pnTU1bJNpKEDuPjW59f4S+KgDfFylNzqEi4APbtFO1hvnw0hVQltEiAVYqoFI5pmXsdB
 8ZWeVDHNgY8DO8Lj55FpBsUTAQOV3WYM0uFQFXl0eenrqcuyq3NoBJwHO91BIiVM31BZ
 gXOEOyzhsPVxdQpwT5kjavmiu2oubTbyMEXTn/Ss97uQNJDMc9LkJQEhNBRbtmi3SVtt
 y+DLQ5LxSk4l5MqmI2tQ7iVOU6ebt3xLOhrK/HKXLadlclWZUmAMyueAt+CG4uh+rsYw
 5z+Q==
X-Gm-Message-State: AC+VfDyc+eNsiO7U1AT2cEI/Czl0Hyj4Z70/NfVdwvKBVwLi5M7LP1Xj
 9dox3TXYOkwsvbP6vRmOvrbhb5FK92SjPKZnNICklKe+ZUM8ua5a
X-Google-Smtp-Source: ACHHUZ67anPk20e4fhcB+lcKQ33S5JZij9fJmMSMWn64OYe9f4KL2oRRkKAapNbRquWsLjOprzgIfYtbHnyR1Zll0E4=
X-Received: by 2002:a17:906:eec9:b0:94e:46ef:1361 with SMTP id
 wu9-20020a170906eec900b0094e46ef1361mr15480980ejb.34.1683733874536; Wed, 10
 May 2023 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-5jM-V+J5aZTnu86NzgKw3LGSZ76LyTusrF-MF+V_LjV3u7A@mail.gmail.com>
 <4838148.31r3eYUQgx@x2>
In-Reply-To: <4838148.31r3eYUQgx@x2>
From: kathy lyons <kathy.lyons@zayo.com>
Date: Wed, 10 May 2023 11:51:04 -0400
Message-ID: <CAN-5jM9GMjCpV6K-sFnsaJUK_AXFaytWz0mB9rAzEVHHqt05Zw@mail.gmail.com>
Subject: Re: sending audit logs only to audit.log via rsyslog
To: Steve Grubb <sgrubb@redhat.com>
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zayo.com
Content-Type: multipart/mixed; boundary="===============8868965221438832292=="

--===============8868965221438832292==
Content-Type: multipart/alternative; boundary="0000000000007d524b05fb58d7d5"

--0000000000007d524b05fb58d7d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great - so I don't need the line below in my rsyslog.conf file?

                 audit.*               ~/var/log/audit/audit.log

On Wed, May 10, 2023 at 9:51=E2=80=AFAM Steve Grubb <sgrubb@redhat.com> wro=
te:

> On Wednesday, May 10, 2023 9:43:04 AM EDT kathy lyons wrote:
> >  Good morning.  I am trying to get the audit logs to be written only to
> > audit.log.  Currently they are written to audit.log as well as syslog.
> > Here is my rsyslog.conf file - what am I doing wrong?
> >
> >     module(load=3D"imfile")
> >     module(load=3D"imklog")
> >     module(load=3D"imjournal")
> >
> >     global(net.enableDNS=3D"off" workDirectory=3D/var/spool/rsyslog"
> > maxMessageSize=3D"128k")
> >
> >    $IncludeConfig /etc/rsyslog.d/*.conf
> >    $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
> >
> >   ##################### rules
> >     audit.*                                 ~/var/log/audit/audit.log
> >     auth.warning;authpriv.info   ~/var/log/auth.log
> >     *.*;auth,authpriv.none           ~/var/log/syslog
> >     cron.info                               ~/var/log/cron.log
> >     daemon.info                        ~/var/log/daemon.log
> >     kern.*                                  ~/var/log/kern.log
> >     user.info                             ~/var/log/user.log
>
> The thing that is writing them to rsyslog is systemd-journald. You can
> stop
> this by running:
>
> systemctl mask systemd-journald-audit.socket
> systemctl stop systemd-journald-audit.socket
>
> Then you will only have logs written to the audit log.
>
> -Steve
>
>
>

--0000000000007d524b05fb58d7d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Great - so I don&#39;t need the line below in my rsys=
log.conf file?<br><br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audit.*=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~/var=
/log/audit/audit.log<br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 10, 2023 at 9:51=E2=80=AFAM Steve Grubb=
 &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wednesday, Ma=
y 10, 2023 9:43:04 AM EDT kathy lyons wrote:<br>
&gt;=C2=A0 Good morning.=C2=A0 I am trying to get the audit logs to be writ=
ten only to<br>
&gt; audit.log.=C2=A0 Currently they are written to audit.log as well as sy=
slog.<br>
&gt; Here is my rsyslog.conf file - what am I doing wrong?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0module(load=3D&quot;imfile&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0module(load=3D&quot;imklog&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0module(load=3D&quot;imjournal&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0global(net.enableDNS=3D&quot;off&quot; workDirector=
y=3D/var/spool/rsyslog&quot;<br>
&gt; maxMessageSize=3D&quot;128k&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 $IncludeConfig /etc/rsyslog.d/*.conf<br>
&gt;=C2=A0 =C2=A0 $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0##################### rules<br>
&gt;=C2=A0 =C2=A0 =C2=A0audit.*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0~/var/log/audit/audit.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0auth.warning;<a href=3D"http://authpriv.info" rel=
=3D"noreferrer" target=3D"_blank">authpriv.info</a>=C2=A0 =C2=A0~/var/log/a=
uth.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0*.*;auth,authpriv.none=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0~/var/log/syslog<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://cron.info" rel=3D"noreferrer" tar=
get=3D"_blank">cron.info</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/var/log=
/cron.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://daemon.info" rel=3D"noreferrer" t=
arget=3D"_blank">daemon.info</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~/var/log/daemon.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0kern.*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~=
/var/log/kern.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://user.info" rel=3D"noreferrer" tar=
get=3D"_blank">user.info</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/var/log/user.l=
og<br>
<br>
The thing that is writing them to rsyslog is systemd-journald. You can stop=
 <br>
this by running:<br>
<br>
systemctl mask systemd-journald-audit.socket<br>
systemctl stop systemd-journald-audit.socket<br>
<br>
Then you will only have logs written to the audit log.<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div>

--0000000000007d524b05fb58d7d5--

--===============8868965221438832292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8868965221438832292==--


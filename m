Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A1711B75
	for <lists+linux-audit@lfdr.de>; Fri, 26 May 2023 02:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685061736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cv79MAjCmg9rQtc88NMJNCaYtaDXJR/66+BLOApgazc=;
	b=N/HWyGz1MlMjxfVjEcr+t1emQkHgM20hr41zh6NiFemqlz9hKWJE7Z2L4ScfyyPim3pJLZ
	6gJ/34NbXqz1XuIZFDFqoMJQbdPUb9a1pyq6DGb7Qa0qTbD050MUcc3w1D+Ws3z75Set74
	nrpdrCvdSNxa0BJncJ6k8dQLWdZXO5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-f352yNcYOTaOKXU0GL3j-w-1; Thu, 25 May 2023 20:42:12 -0400
X-MC-Unique: f352yNcYOTaOKXU0GL3j-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0EA811E86;
	Fri, 26 May 2023 00:42:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF80C154D1;
	Fri, 26 May 2023 00:42:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AAE8819465B6;
	Fri, 26 May 2023 00:42:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A24919465A4 for <linux-audit@listman.corp.redhat.com>;
 Fri, 26 May 2023 00:41:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 843A740C6CDE; Fri, 26 May 2023 00:41:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB1D40C6CDD
 for <linux-audit@redhat.com>; Fri, 26 May 2023 00:41:37 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61ACE282CCA4
 for <linux-audit@redhat.com>; Fri, 26 May 2023 00:41:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-js3-V8RqNPG7LHHvf45t_A-1; Thu, 25 May 2023 20:41:34 -0400
X-MC-Unique: js3-V8RqNPG7LHHvf45t_A-1
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-96fe2a1db26so26785866b.0; 
 Thu, 25 May 2023 17:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685061692; x=1687653692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ypzMFxcau62kDshUoJfFpQYBIqW77RTPynp1gVVro40=;
 b=HnSC8uD7Cu1i5rqMW40ui58lOt6yb26EGfF/eZOeON976jl9n080whte0bGfaj60Zz
 nZqkK8+jqYBgErw1WKZJY5iF0CuK5aW4DtPsjzUYVK7b5gvzBpx7seAoXsMPEh2d78kP
 08+oOsNtH57mOoka1hJfKmMmLb+310qOW0iOAPgDlFqNCJvqHKyo4lSzIxWGNBEi2lae
 aNNiOFDyYW5bxjy3jUIakM5kgsrKBKebUa+PDs2a9+BsJYcIC3hEW6BvDaHtHnJaHpZj
 yUNWid4UYsyszAZCDy1BWbNbjwHfeP8DlJy/f9Zy+QC54/YTsmkk+n+Tvq1FrOYWD7zt
 KuQQ==
X-Gm-Message-State: AC+VfDzv0afuQ1cuqUj5D33W1l76dR852Jq+b9UbYg4gr8KLWyz1YzC3
 Y3bIR1ORpKKCAQ5eKbMsvheIsgUPl8UX2Ld1stbCG2WE55k=
X-Google-Smtp-Source: ACHHUZ7X+y3s3e9bKy/bq91Y2Cxk/V4oUaybpyfmOvE+mA4AyWvODgbla9fi2P4loqrsbAo7aiiJRX8S7MPgdtoR1nc=
X-Received: by 2002:a17:907:3f27:b0:961:be96:b0e6 with SMTP id
 hq39-20020a1709073f2700b00961be96b0e6mr424860ejc.68.1685061692118; Thu, 25
 May 2023 17:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdJdQnpmK3uN7R_CNQs3+HdLKfswgQpqT95+O0_Bawc7zMKHw@mail.gmail.com>
 <4811240.GXAFRqVoOG@x2> <ZG5tKxgzVJLxSZm9@madcap2.tricolour.ca>
In-Reply-To: <ZG5tKxgzVJLxSZm9@madcap2.tricolour.ca>
From: "warron.french" <warron.french@gmail.com>
Date: Thu, 25 May 2023 20:41:20 -0400
Message-ID: <CAJdJdQk4-CL7fj3US+LkAR1_p9OJmbfUwYM687gkjF5c3RZV1g@mail.gmail.com>
Subject: Re: No more report of quantity of rules successfully loaded
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Linux Audit <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============6864479355722661586=="

--===============6864479355722661586==
Content-Type: multipart/alternative; boundary="0000000000009558fb05fc8dffa2"

--0000000000009558fb05fc8dffa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Obviously both of you are correct.  I am thinking about the number of rules
that load when not all of the rules load.  Specifically, it gives a line
number of the last line that loaded from the rules.  Which, for
troubleshooting purposes, I always put into a single file and sort
"alphabetically."

Also, I solved my own problem on the ruleset in the single file I was
working with on my VM.  I had 220 lines of syntax, and many of the lines
were auditd controls, because I do not know the exact term to label them;
things like -D -b -e -f and so on.

Thank you both, sorry for the disruption.
--------------------------
Warron French



On Wed, May 24, 2023 at 4:01=E2=80=AFPM Richard Guy Briggs <rgb@redhat.com>=
 wrote:

> On 2023-05-24 10:42, Steve Grubb wrote:
> > Hello Warron,
> >
> > On Tuesday, May 23, 2023 7:12:07 PM EDT warron.french wrote:
> > > Hi, I am running auditd-3.0.7-4 on an Alma Linux v8.8.
> > >
> > > I know that for all of RHEL 6 and RHEL 7 variants that I worked with,
> to
> > > include CentOS (not Stream) that after I rebooted a server or
> restarted the
> > > auditd service (with -e 1 set) that I would 100% of the time get a
> report
> > > in /var/log/messages about the quantity of rules that successfully
> loaded.
> >
> > It has never done that unless someone else has a patch they did not sen=
d
> > upstream.
> >
> > > I could compare that to my unified rules file
> > > (/etc/audit/rules.d/Unified.rules - for a reference) and strip out th=
e
> > > typical for auditd Control rules (-D, -e 1, -f 1, -b, -r, for
> examples) and
> > > then assess if I had the full set of files loaded or not.
> > >
> > > With this implementation of auditd, on version 3.0.7-4, I am not
> getting
> > > those results anymore.
> > > Am I looking in the wrong place, because for me this is important
> > > information?
> >
> > It has never done that. auditctl -D gives the output of auditctl -s as =
a
> > convenience. But auditctl -s has never reported how many rules are
> loaded. I
> > don't think the kernel has a counter. It has a variable for if any rule=
s
> are
> > loaded, but not the quantity.
>
> Minor correction: there is a kernel variable (audit_n_rules) that counts
> the number of syscall rules in place, but it isn't reported directly
> outside the kernel.  This feeds the boolean (struct
> audit_context)->dummy.
>
> > > Yes, I know that I can also manually execute "auditctl -l  | wc -l"
> and get
> > > that information  too, but I was wondering if this is planned or if I
> am
> > > looking in the wrong place, or what to do.
> >
> > It has never done that and is not planned.
> >
> > -Steve
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
>
>

--0000000000009558fb05fc8dffa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Obviously both of you are correct.=C2=A0 I am thinking abo=
ut the number of rules that load when not all of the rules load.=C2=A0 Spec=
ifically, it gives a line number of the last line that loaded from the rule=
s.=C2=A0 Which, for troubleshooting purposes, I always put into a single fi=
le and sort &quot;alphabetically.&quot;<div><br></div><div>Also, I solved m=
y own problem on the ruleset in the single file I was working with on my VM=
.=C2=A0 I had 220 lines of syntax, and many of the lines were auditd contro=
ls, because I do not know the exact term to label them; things like -D -b -=
e -f and so on.</div><div><br></div><div>Thank you both, sorry for the disr=
uption.<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><div dir=3D"ltr">-------------------------=
-<br><font color=3D"#000099" size=3D"4">Warron French<br><font size=3D"4"><=
font size=3D"4"><font size=3D"4"><br></font></font></font></font></div></di=
v></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, May 24, 2023 at 4:01=E2=80=AFPM Richard Guy Brigg=
s &lt;<a href=3D"mailto:rgb@redhat.com">rgb@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 2023-05-24 10:42, =
Steve Grubb wrote:<br>
&gt; Hello Warron,<br>
&gt; <br>
&gt; On Tuesday, May 23, 2023 7:12:07 PM EDT warron.french wrote:<br>
&gt; &gt; Hi, I am running auditd-3.0.7-4 on an Alma Linux v8.8.<br>
&gt; &gt; <br>
&gt; &gt; I know that for all of RHEL 6 and RHEL 7 variants that I worked w=
ith, to<br>
&gt; &gt; include CentOS (not Stream) that after I rebooted a server or res=
tarted the<br>
&gt; &gt; auditd service (with -e 1 set) that I would 100% of the time get =
a report<br>
&gt; &gt; in /var/log/messages about the quantity of rules that successfull=
y loaded.<br>
&gt; <br>
&gt; It has never done that unless someone else has a patch they did not se=
nd <br>
&gt; upstream.<br>
&gt; <br>
&gt; &gt; I could compare that to my unified rules file<br>
&gt; &gt; (/etc/audit/rules.d/Unified.rules - for a reference) and strip ou=
t the<br>
&gt; &gt; typical for auditd Control rules (-D, -e 1, -f 1, -b, -r, for exa=
mples) and<br>
&gt; &gt; then assess if I had the full set of files loaded or not.<br>
&gt; &gt; <br>
&gt; &gt; With this implementation of auditd, on version 3.0.7-4, I am not =
getting<br>
&gt; &gt; those results anymore.<br>
&gt; &gt; Am I looking in the wrong place, because for me this is important=
<br>
&gt; &gt; information?<br>
&gt; <br>
&gt; It has never done that. auditctl -D gives the output of auditctl -s as=
 a <br>
&gt; convenience. But auditctl -s has never reported how many rules are loa=
ded. I <br>
&gt; don&#39;t think the kernel has a counter. It has a variable for if any=
 rules are <br>
&gt; loaded, but not the quantity.<br>
<br>
Minor correction: there is a kernel variable (audit_n_rules) that counts<br=
>
the number of syscall rules in place, but it isn&#39;t reported directly<br=
>
outside the kernel.=C2=A0 This feeds the boolean (struct<br>
audit_context)-&gt;dummy.<br>
<br>
&gt; &gt; Yes, I know that I can also manually execute &quot;auditctl -l=C2=
=A0 | wc -l&quot; and get<br>
&gt; &gt; that information=C2=A0 too, but I was wondering if this is planne=
d or if I am<br>
&gt; &gt; looking in the wrong place, or what to do.<br>
&gt; <br>
&gt; It has never done that and is not planned.<br>
&gt; <br>
&gt; -Steve<br>
<br>
- RGB<br>
<br>
--<br>
Richard Guy Briggs &lt;<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">=
rgb@redhat.com</a>&gt;<br>
Sr. S/W Engineer, Kernel Security, Base Operating Systems<br>
Remote, Ottawa, Red Hat Canada<br>
IRC: rgb, SunRaycer<br>
Voice: +1.647.777.2635, Internal: (81) 32635<br>
--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit" rel=3D"=
noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/l=
inux-audit</a><br>
<br>
</blockquote></div>

--0000000000009558fb05fc8dffa2--

--===============6864479355722661586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6864479355722661586==--


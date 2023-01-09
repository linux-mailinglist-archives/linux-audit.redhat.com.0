Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280E66282A
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 15:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673273636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KZah6fIhq/KAtDuTsWR8c0Bv7uNwlRY1UH6osZeq2WU=;
	b=erVyz7TGUBrCtzRdUgbzVOXPem8ze8vStW1sfVmyzDvQMspL4M4Kqaw7jgwHtzNMlRk5Va
	rMKvbDyzODtaPcnjnV3bh6b+5MmEsJv2MtcokFsITWSuDm2s4Q5MuHarpwPUZWkP+kxBbh
	2rjVoATPrI+WvYZyYZsAZskAI1SQ/io=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-r5DXtYsoNBO7BXV72cfuWg-1; Mon, 09 Jan 2023 09:13:52 -0500
X-MC-Unique: r5DXtYsoNBO7BXV72cfuWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C449218A6469;
	Mon,  9 Jan 2023 14:13:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBFF0401A603;
	Mon,  9 Jan 2023 14:13:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C122D1947BB1;
	Mon,  9 Jan 2023 14:13:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EDBE21946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 08:30:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE7D1C16027; Mon,  9 Jan 2023 08:30:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D66D1C16026
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 08:30:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB3FA802C1D
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 08:30:42 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-_bQH4BbHPp68b29z2lqkzw-1; Mon, 09 Jan 2023 03:30:38 -0500
X-MC-Unique: _bQH4BbHPp68b29z2lqkzw-1
Received: by mail-ed1-f50.google.com with SMTP id 18so11405981edw.7;
 Mon, 09 Jan 2023 00:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRBlO3BJZMSnD2qomK9cJWx5iylqkbW5fgFNrdPGNY0=;
 b=xuTos7I1DaMlC1UT5hZVjJR/HsFU+jdoqTyn+jUGd/doxpXELiaYPEsjB8fi8UEEDI
 HSM8Ur+SSpfPxDRXZXM/Irx3SoD+4OtMhchz4wv4VqgbjkJoCXAcXJymUiVXuQVKq0DN
 DX+YvWtXTq8KUXvd6aQsr8jeWbuZkdUkl+n5bEzpNhE8vVewvMzyJYgwz/CqlyOLafnt
 zbYbczQwiPs2gyLcwWxgUtU4nArfjs9zRln/x1BVNvrT5993spgzlJENdSA5LYkarvYb
 zE6mBV4LqCDwwYeoZxJqr7tRUYUcTaUIH+SVgaCdolEsDrj6hNxym6JWQ5de+4vPz4kR
 HEcw==
X-Gm-Message-State: AFqh2kqzLKwB8dRtBKYCxaFc3f7NFY4/rXUw8p0EcMagqkxPXDPpSkdV
 PmDe5eZkjV361U7S45bB7RNgQA/jSfUrY+QWfon/OzYWBlju8g==
X-Google-Smtp-Source: AMrXdXsLmD+kzlRmrIBrF3XvRlQt4wapLihSqgRIJAKP2TPXRJ1cxlnAd3dXMz6bzxgBXwQn4S/Y2jG46who/GPdISY=
X-Received: by 2002:aa7:de06:0:b0:494:9a63:8be6 with SMTP id
 h6-20020aa7de06000000b004949a638be6mr1379612edv.418.1673253037355; Mon, 09
 Jan 2023 00:30:37 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
 <5654293.DvuYhMxLoT@x2>
 <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
 <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
From: Ariel Silver <arielsilver77@gmail.com>
Date: Mon, 9 Jan 2023 10:30:25 +0200
Message-ID: <CACKMdfkhwyU4=DYVd5AHo+AQb50nyrDg3tTO7H615GogNCcv=A@mail.gmail.com>
Subject: Re: New bug in Audit
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 09 Jan 2023 14:13:43 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2860799957442637036=="

--===============2860799957442637036==
Content-Type: multipart/alternative; boundary="000000000000e9367005f1d09441"

--000000000000e9367005f1d09441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey guys and thank you for the quick reply, Much appreciated!

As Richard and Steve mentioned the commit:
https://github.com/linux-audit/audit-kernel/commit/1b2263a807ca651f94517b1b=
22dc5f13e494984d
Fixed this issue.

Any timeframe to when we can get a new version of auditd with that fix?
Or should I count on redhat to release an update to the kernel ?

Any update will be good.

Once again thanks a lot!

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=95=D7=
=B3, 6 =D7=91=D7=99=D7=A0=D7=95=D7=B3 2023 =D7=91-22:33 =D7=9E=D7=90=D7=AA =
=E2=80=AAPaul Moore=E2=80=AC=E2=80=8F <=E2=80=AApaul@paul-moore.com
=E2=80=AC=E2=80=8F>:=E2=80=AC

> On Thu, Jan 5, 2023 at 2:32 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Thu, Jan 5, 2023 at 11:32 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > > On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:
> > > > On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.co=
m
> >
> > > wrote:
> > > > > I found the following bug:
> > > > >
> > > > > OS version =3D Red Hat Enterprise Linux release 8.6 (Ootpa)
> > > > > Kernel version =3D 4.18.0-425.3.1.el8.x86_64
> > > > > auditctl version =3D 3.0.7
> > > >
> > > > This mailing list is focused on the development and support of
> > > > upstream Linux Kernels and Steve's audit userspace, we don't really
> > > > provide support for paid distributions.  If you are seeing problems
> > > > with the upstream Linux Kernel or tools, please report them here, b=
ut
> > > > issues with distribution kernels and/or tools should be sent to the
> > > > distribution for support/assistance.
> > >
> > > Paul, we take bug reports and help requests from anyone. Often,
> distributions
> > > are how we first hear of problems.
> >
> > Steve, re-read what I wrote.
> >
> > This mailing list is *focused* on upstream work and support, and while
> > it does not preclude talking about distro specific bugs, I believe
> > there are better avenues for those discussions (e.g. see the RHBZ link
> > I provided in my response) as upstream isn't really going to be able
> > to provide adequate help for someone experiencing problems with a
> > distro kernel which has a number of patches and backports.
> >
> > If you have a problem with this approach, perhaps we should move
> > upstream development to an audit mailing list on vger.kernel.org and
> > leave this list for RH specific issues?
>
> Steve, I realize it's only been ~24hrs, but should I assume you are
> okay with that (the upstream focused approach)?
>
> --
> paul-moore.com
>

--000000000000e9367005f1d09441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div dir=3D"ltr">Hey guys and thank you for the quick repl=
y, Much appreciated!<br><br>As Richard and Steve mentioned=C2=A0the commit:=
 <a href=3D"https://github.com/linux-audit/audit-kernel/commit/1b2263a807ca=
651f94517b1b22dc5f13e494984d">https://github.com/linux-audit/audit-kernel/c=
ommit/1b2263a807ca651f94517b1b22dc5f13e494984d</a></div><div dir=3D"ltr">Fi=
xed this issue.<br><br>Any timeframe to when we can get a new version=C2=A0=
of auditd with that fix?<br>Or should I count on redhat to release an updat=
e=C2=A0to the kernel ?<br><br>Any update will be good.<br><br>Once again th=
anks a lot!</div></div><br><div class=3D"gmail_quote"><div dir=3D"rtl" clas=
s=3D"gmail_attr">=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=
=D7=9D =D7=95=D7=B3, 6 =D7=91=D7=99=D7=A0=D7=95=D7=B3 2023 =D7=91-22:33 =D7=
=9E=D7=90=D7=AA =E2=80=AAPaul Moore=E2=80=AC=E2=80=8F &lt;=E2=80=AA<a href=
=3D"mailto:paul@paul-moore.com">paul@paul-moore.com</a>=E2=80=AC=E2=80=8F&g=
t;:=E2=80=AC<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, Jan 5, 2023 at 2:32 PM Paul Moore &lt;<a href=3D"mailto:paul@paul-moor=
e.com" target=3D"_blank">paul@paul-moore.com</a>&gt; wrote:<br>
&gt; On Thu, Jan 5, 2023 at 11:32 AM Steve Grubb &lt;<a href=3D"mailto:sgru=
bb@redhat.com" target=3D"_blank">sgrubb@redhat.com</a>&gt; wrote:<br>
&gt; &gt; On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:<br=
>
&gt; &gt; &gt; On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver &lt;<a href=3D"m=
ailto:arielsilver77@gmail.com" target=3D"_blank">arielsilver77@gmail.com</a=
>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; I found the following bug:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; OS version =3D Red Hat Enterprise Linux release 8.6 (Oo=
tpa)<br>
&gt; &gt; &gt; &gt; Kernel version =3D 4.18.0-425.3.1.el8.x86_64<br>
&gt; &gt; &gt; &gt; auditctl version =3D 3.0.7<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This mailing list is focused on the development and support =
of<br>
&gt; &gt; &gt; upstream Linux Kernels and Steve&#39;s audit userspace, we d=
on&#39;t really<br>
&gt; &gt; &gt; provide support for paid distributions.=C2=A0 If you are see=
ing problems<br>
&gt; &gt; &gt; with the upstream Linux Kernel or tools, please report them =
here, but<br>
&gt; &gt; &gt; issues with distribution kernels and/or tools should be sent=
 to the<br>
&gt; &gt; &gt; distribution for support/assistance.<br>
&gt; &gt;<br>
&gt; &gt; Paul, we take bug reports and help requests from anyone. Often, d=
istributions<br>
&gt; &gt; are how we first hear of problems.<br>
&gt;<br>
&gt; Steve, re-read what I wrote.<br>
&gt;<br>
&gt; This mailing list is *focused* on upstream work and support, and while=
<br>
&gt; it does not preclude talking about distro specific bugs, I believe<br>
&gt; there are better avenues for those discussions (e.g. see the RHBZ link=
<br>
&gt; I provided in my response) as upstream isn&#39;t really going to be ab=
le<br>
&gt; to provide adequate help for someone experiencing problems with a<br>
&gt; distro kernel which has a number of patches and backports.<br>
&gt;<br>
&gt; If you have a problem with this approach, perhaps we should move<br>
&gt; upstream development to an audit mailing list on <a href=3D"http://vge=
r.kernel.org" rel=3D"noreferrer" target=3D"_blank">vger.kernel.org</a> and<=
br>
&gt; leave this list for RH specific issues?<br>
<br>
Steve, I realize it&#39;s only been ~24hrs, but should I assume you are<br>
okay with that (the upstream focused approach)?<br>
<br>
-- <br>
<a href=3D"http://paul-moore.com" rel=3D"noreferrer" target=3D"_blank">paul=
-moore.com</a><br>
</blockquote></div>

--000000000000e9367005f1d09441--

--===============2860799957442637036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2860799957442637036==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29C9D2D1BC8
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:14:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-UeOjabdgM-qSsyWQzv00Gw-1; Mon, 07 Dec 2020 16:14:19 -0500
X-MC-Unique: UeOjabdgM-qSsyWQzv00Gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1AE785818B;
	Mon,  7 Dec 2020 21:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6AEA2B394;
	Mon,  7 Dec 2020 21:14:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4A47180954D;
	Mon,  7 Dec 2020 21:14:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7LDs0p024388 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:13:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD6C11112844; Mon,  7 Dec 2020 21:13:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D071112843
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:13:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B1F2802A5D
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:13:52 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-n_h3lJDHMHi62_nqTuwI1w-1; Mon, 07 Dec 2020 16:13:47 -0500
X-MC-Unique: n_h3lJDHMHi62_nqTuwI1w-1
Received: by mail-ot1-f66.google.com with SMTP id j12so13879519ota.7;
	Mon, 07 Dec 2020 13:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9D6gTb6aUF11LFnyBmZ1EsGCba0TdUjRe1PBGUlZjZs=;
	b=Wpgt8+vaPqsI1VO8KhFiBNLnKZAaxRmEIBCcbh2gsZRlMmQ2yINL9J6bJ10gn8alhT
	dtIXjNdgOOjN/fY9UqDaNltNvmWO5gk7guTTd1BOY3ySYWk/JTTPdKSVz+v2+nria85j
	Ehmmx3ptX9X06e3q6KI0guYHlrPJ6euVKryLEh1adT3b4RQPy9XelSmflb+qMyu3ZX+R
	Etwezr82Zk/GmMANsTg03wCiIE1mi/AR6qFBIa6QLRymSEHXv3Tr9fjjbQ0bHf58r1I9
	ow7xKvljz6tCg1vRpblVe9xWo0vs3ulsuNT0v2otttDXitV0XyIArcOo0PkXheDXKnsb
	RWtg==
X-Gm-Message-State: AOAM532jAsG4RtkClMlRb8f9d/rYMcb8IaOV2PP211sUATr6AES/mEua
	J8OWvqUDQfPyOjVFTYlQ3lbkyZT1P+GEDfTxuixgmsFPBTY7dA==
X-Google-Smtp-Source: ABdhPJz5votKUVBHkhfhT26yArDs5MwINpSyHhdMTXtol4oSLxNP+8ViNiM+2b5g+jR0LyqMiz/WAyzzm+FHVqFWHUM=
X-Received: by 2002:a9d:68c3:: with SMTP id i3mr15039370oto.31.1607375626693; 
	Mon, 07 Dec 2020 13:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
	<5413598.DvuYhMxLoT@x2>
	<CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
In-Reply-To: <CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
From: Max Englander <max.englander@gmail.com>
Date: Mon, 7 Dec 2020 16:13:35 -0500
Message-ID: <CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2844387291367945947=="

--===============2844387291367945947==
Content-Type: multipart/alternative; boundary="0000000000003ff25205b5e64d70"

--0000000000003ff25205b5e64d70
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 4, 2020 at 3:41 PM Paul Moore <paul@paul-moore.com> wrote:

> On Thu, Dec 3, 2020 at 9:47 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:
> > > > > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > > > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > > > > Commit:     Paul Moore <pmoore@redhat.com>
> > > > > > CommitDate: 2014-11-17 16:53:51 -0500
> > > > > > ("audit: convert status version to a feature bitmap")
> > > > > > It was introduced specifically to enable distributions to
> selectively
> > > > > > backport features.  It was converted away from AUDIT_VERSION.
> > > > > >
> > > > > > There are other ways to detect the presence of
> > > > > > backlog_wait_time_actual
> > > > > > as I mentioned above.
> > > > >
> > > > > Let me be blunt - I honestly don't care what Steve's audit
> userspace
> > > > > does to detect this.  I've got my own opinion, but Steve's audit
> > > > > userspace is not my project to manage and I think we've established
> > > > > over the years that Steve and I have very different views on what
> > > > > constitutes good design.
> > > >
> > > > And guessing what might be in buffers of different sizes is good
> design?
> > > > The FEATURE_BITMAP was introduced to get rid of this ambiguity.
> > >
> > > There is just soo much to unpack in your comment Steve, but let me
> > > keep it short ...
> > >
> > > - This is an enterprise distro problem, not an upstream problem.  The
> > > problems you are talking about are not a problem for upstream.
> >
> > You may look at it that way. I do not. Audit -userspace is also an
> upstream
> > for a lot of distros and I need to make this painless for them. So,
> while you
> > may think of this being a backport problem for Red Hat to solve, I think
> of
> > this as a generic problem that I'd like to solve for Debian, Suse,
> Ubuntu,
> > Arch, Gentoo, anyone using audit. We both are upstream.
>
> I intentionally said "enterprise Linux distributions", I never singled
> out RH/IBM.  Contrary to what RH/IBM marketing may have me believe, I
> don't consider RHEL to be the only "enterprise Linux distribution" :)
>
> Beyond that, while I haven't looked at all of the distros you list
> above, I know a few of them typically only backport fixes, not new
> features.  Further, as I mentioned previously in this thread, there is
> a way to backport this feature in a safe manner without using the
> feature bits.  Eeeeeven further, if there wasn't a way to backport
> this feature safely (and let me stress agai that you can backport this
> safely), I would still consider that to be a distro problem and not an
> upstream kernel problem.  The upstream kernel is not responsible for
> enabling or supporting arbitrary combinations of patches.
>
> --
> paul moore
> www.paul-moore.com
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>
>
Hi Steve, Paul,

I'm replying with the Gmail UI since I don't have my Mutt setup handy, so
apologies for any formatting which doesn't align with the mailing list best
 practices!

First off, my apologies for being late to the thread, and for submitting
code
to the kernel and user space which aren't playing nicely with each other.

It sounds like there's a decision to be made around whether or not to use
the bitmap feature flags which I probably am probably not in a position to
help decide. However, I'm more than happy to fix my userspace PR so
that it does not rely on the feature flag space using the approach Paul
outlined, in spite of the drawbacks, if that ends up being the decision.

Steve, I understand your preference to rely on the feature bitmap since it
is a more reliable way to determine the availability of a feature than
key size, but if you're open to Paul's recommendations in spite of the
drawbacks, I'll make the changes to my patch as soon as I can to unblock
your work.

Separately, since there is tension between these two approaches
(structure size and bitmap), I wonder if Paul/Steve you would be open
to a third way.

For example, I can imagine adding additional bitmap
spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).
Alternately, I can imagine each feature being assigned a unique u64
ID, and user space programs querying the kernel to see whether a
a particular feature is enabled.

I'm not familiar enough with the kernel to be able to judge how sound
either idea is (or if these have been considered and rejected in the past)
but if you all think a third way is viable, I'd be happy to start a separate
mailing thread to try to thread the competing requirements of the kernel
and userspace, and contribute code if we can find a solution.

Max

--0000000000003ff25205b5e64d70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 3:41 PM Paul Moore &lt=
;<a href=3D"mailto:paul@paul-moore.com">paul@paul-moore.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 3, 2=
020 at 9:47 PM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.com" target=
=3D"_blank">sgrubb@redhat.com</a>&gt; wrote:<br>
&gt; On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:<br>
&gt; &gt; &gt; &gt; &gt; Author:=C2=A0 =C2=A0 =C2=A0Richard Guy Briggs &lt;=
<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">rgb@redhat.com</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt; AuthorDate: 2014-11-17 15:51:01 -0500<br>
&gt; &gt; &gt; &gt; &gt; Commit:=C2=A0 =C2=A0 =C2=A0Paul Moore &lt;<a href=
=3D"mailto:pmoore@redhat.com" target=3D"_blank">pmoore@redhat.com</a>&gt;<b=
r>
&gt; &gt; &gt; &gt; &gt; CommitDate: 2014-11-17 16:53:51 -0500<br>
&gt; &gt; &gt; &gt; &gt; (&quot;audit: convert status version to a feature =
bitmap&quot;)<br>
&gt; &gt; &gt; &gt; &gt; It was introduced specifically to enable distribut=
ions to selectively<br>
&gt; &gt; &gt; &gt; &gt; backport features.=C2=A0 It was converted away fro=
m AUDIT_VERSION.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; There are other ways to detect the presence of<br>
&gt; &gt; &gt; &gt; &gt; backlog_wait_time_actual<br>
&gt; &gt; &gt; &gt; &gt; as I mentioned above.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Let me be blunt - I honestly don&#39;t care what Steve&=
#39;s audit userspace<br>
&gt; &gt; &gt; &gt; does to detect this.=C2=A0 I&#39;ve got my own opinion,=
 but Steve&#39;s audit<br>
&gt; &gt; &gt; &gt; userspace is not my project to manage and I think we&#3=
9;ve established<br>
&gt; &gt; &gt; &gt; over the years that Steve and I have very different vie=
ws on what<br>
&gt; &gt; &gt; &gt; constitutes good design.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And guessing what might be in buffers of different sizes is =
good design?<br>
&gt; &gt; &gt; The FEATURE_BITMAP was introduced to get rid of this ambigui=
ty.<br>
&gt; &gt;<br>
&gt; &gt; There is just soo much to unpack in your comment Steve, but let m=
e<br>
&gt; &gt; keep it short ...<br>
&gt; &gt;<br>
&gt; &gt; - This is an enterprise distro problem, not an upstream problem.=
=C2=A0 The<br>
&gt; &gt; problems you are talking about are not a problem for upstream.<br=
>
&gt;<br>
&gt; You may look at it that way. I do not. Audit -userspace is also an ups=
tream<br>
&gt; for a lot of distros and I need to make this painless for them. So, wh=
ile you<br>
&gt; may think of this being a backport problem for Red Hat to solve, I thi=
nk of<br>
&gt; this as a generic problem that I&#39;d like to solve for Debian, Suse,=
 Ubuntu,<br>
&gt; Arch, Gentoo, anyone using audit. We both are upstream.<br>
<br>
I intentionally said &quot;enterprise Linux distributions&quot;, I never si=
ngled<br>
out RH/IBM.=C2=A0 Contrary to what RH/IBM marketing may have me believe, I<=
br>
don&#39;t consider RHEL to be the only &quot;enterprise Linux distribution&=
quot; :)<br>
<br>
Beyond that, while I haven&#39;t looked at all of the distros you list<br>
above, I know a few of them typically only backport fixes, not new<br>
features.=C2=A0 Further, as I mentioned previously in this thread, there is=
<br>
a way to backport this feature in a safe manner without using the<br>
feature bits.=C2=A0 Eeeeeven further, if there wasn&#39;t a way to backport=
<br>
this feature safely (and let me stress agai that you can backport this<br>
safely), I would still consider that to be a distro problem and not an<br>
upstream kernel problem.=C2=A0 The upstream kernel is not responsible for<b=
r>
enabling or supporting arbitrary combinations of patches.<br>
<br>
-- <br>
paul moore<br>
<a href=3D"http://www.paul-moore.com" rel=3D"noreferrer" target=3D"_blank">=
www.paul-moore.com</a><br>
<br>
--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" rel=3D"nore=
ferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-aud=
it</a><br>
<br></blockquote><div><br></div><div>Hi Steve, Paul,=C2=A0</div><div><br></=
div><div>I&#39;m replying with the Gmail UI since I don&#39;t have my Mutt =
setup handy, so=C2=A0</div><div>apologies for any formatting which doesn&#3=
9;t align with the=C2=A0mailing list best</div><div>=C2=A0practices!</div><=
div><br></div><div>First off, my apologies for being late to the thread, an=
d for submitting code</div><div>to the kernel and user space which aren&#39=
;t playing nicely with each other.</div><div><br></div><div>It sounds like =
there&#39;s a decision to be made around whether or not to use</div><div>th=
e bitmap feature flags which I probably am probably not in a position to</d=
iv><div>help decide. However, I&#39;m more than happy to fix my userspace P=
R so</div><div>that it does=C2=A0not rely on the feature flag space using t=
he approach Paul</div><div>outlined, in spite of the drawbacks, if that end=
s up being the decision.</div><div><br></div><div>Steve, I understand your =
preference to rely on the feature bitmap since it</div><div>is a more relia=
ble way to determine the availability of a feature than</div><div>key size,=
 but if you&#39;re open to Paul&#39;s recommendations in spite of the</div>=
<div>drawbacks, I&#39;ll make the changes to my patch as soon as I can to u=
nblock</div><div>your work.</div><div><br></div><div>Separately, since ther=
e is tension between these two approaches<br></div><div>(structure size and=
 bitmap), I wonder if Paul/Steve you would be open</div><div>to a third way=
.=C2=A0</div><div><br></div><div>For example, I can imagine adding addition=
al bitmap<br></div><div>spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).<=
/div><div>Alternately, I can imagine each feature being assigned a unique u=
64</div><div>ID, and user space programs querying the kernel to see whether=
 a</div><div>a particular feature is enabled.</div><div><br></div><div>I&#3=
9;m not familiar enough with the kernel to be able to judge how sound</div>=
<div>either idea is (or if these have been considered and rejected in the p=
ast)</div><div>but if you all think a third way is viable, I&#39;d be happy=
 to start a separate</div><div>mailing thread to try to thread the competin=
g requirements of the kernel</div><div>and userspace, and contribute code i=
f we can find a solution.</div><div><br></div><div>Max=C2=A0</div></div></d=
iv>

--0000000000003ff25205b5e64d70--

--===============2844387291367945947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2844387291367945947==--


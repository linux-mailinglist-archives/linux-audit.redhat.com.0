Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 90E142D1C17
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:28:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-gmcTNnN3P4qHlVyAirooAA-1; Mon, 07 Dec 2020 16:28:46 -0500
X-MC-Unique: gmcTNnN3P4qHlVyAirooAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D3910054FF;
	Mon,  7 Dec 2020 21:28:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E58CB19D6C;
	Mon,  7 Dec 2020 21:28:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD2694A7C6;
	Mon,  7 Dec 2020 21:28:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7LSYrR025528 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:28:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C1D22026D38; Mon,  7 Dec 2020 21:28:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76C7A2026D36
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:28:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12F2C800140
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:28:32 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-584-aUtaStfEOnam4GiwDvbuVw-1; Mon, 07 Dec 2020 16:28:26 -0500
X-MC-Unique: aUtaStfEOnam4GiwDvbuVw-1
Received: by mail-ot1-f49.google.com with SMTP id x13so6420728oto.8;
	Mon, 07 Dec 2020 13:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hwKXHqqSmqzskHoHMCDvgWSk/5ep3RHnoK1YTidLv+U=;
	b=fQV1EfylJZaH6FoSZEiu30QfBkluSYXz0hC4jCanlBv2JYU9eqs15aiGoE2vSy6DnC
	2AyHTCphLGmQGZNuxoRQlQuGlqM95Xndva8D+Lz9pX49WJV0JzZW+HSZYeHOmP/Cu07B
	oBpVfVnD80YpHsX/wxc2U9UT5bty1X6h7UeRs8vuxv2TmDNs51tNNPj6PW3MMZS6MC+n
	vFfoluSXuuEHlCg+Al7cAJExISFjZzQ1/7a+xgN4bnugh9HGH/jY8l1/kXZz4SV5axKL
	uQH3chEY55QevafyjkraOs/tFBQdoFFGZ0Veu6SuxrUFn+ShKEf4SAawkMTGajis7htV
	HuLQ==
X-Gm-Message-State: AOAM531HBKLRLDDcNCvS/NdGL7IWKacBgaSE9gPXnWeVRWcwyrAb/9xK
	FXP9qj+t3QUOUSIN/Kr9Cx/Idonex+mFzSlufqA7z+YBCpw=
X-Google-Smtp-Source: ABdhPJxp0hIgdTzmT49Qtyr46Mm9MAob7xdNR4x9ryZIFZ62L3gLFuDX4zWEzsSqqDGIu9+u6yMacZJRGek+PjTsnk4=
X-Received: by 2002:a9d:68c3:: with SMTP id i3mr15074783oto.31.1607376505318; 
	Mon, 07 Dec 2020 13:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
	<5413598.DvuYhMxLoT@x2>
	<CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
	<CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
	<20201207212100.GN986374@madcap2.tricolour.ca>
In-Reply-To: <20201207212100.GN986374@madcap2.tricolour.ca>
From: Max Englander <max.englander@gmail.com>
Date: Mon, 7 Dec 2020 16:28:14 -0500
Message-ID: <CAK50otWFQveN3GSBVEz07cnSR90YOb0QeiX-PJzB4W2rkJ02ow@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3698172154188609979=="

--===============3698172154188609979==
Content-Type: multipart/alternative; boundary="0000000000009eb30c05b5e681b2"

--0000000000009eb30c05b5e681b2
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 4:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:

> On 2020-12-07 16:13, Max Englander wrote:
> > On Fri, Dec 4, 2020 at 3:41 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > > On Thu, Dec 3, 2020 at 9:47 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > > On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:
> > > > > > > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > > > > > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > > > > > > Commit:     Paul Moore <pmoore@redhat.com>
> > > > > > > > CommitDate: 2014-11-17 16:53:51 -0500
> > > > > > > > ("audit: convert status version to a feature bitmap")
> > > > > > > > It was introduced specifically to enable distributions to
> > > selectively
> > > > > > > > backport features.  It was converted away from AUDIT_VERSION.
> > > > > > > >
> > > > > > > > There are other ways to detect the presence of
> > > > > > > > backlog_wait_time_actual
> > > > > > > > as I mentioned above.
> > > > > > >
> > > > > > > Let me be blunt - I honestly don't care what Steve's audit
> > > userspace
> > > > > > > does to detect this.  I've got my own opinion, but Steve's
> audit
> > > > > > > userspace is not my project to manage and I think we've
> established
> > > > > > > over the years that Steve and I have very different views on
> what
> > > > > > > constitutes good design.
> > > > > >
> > > > > > And guessing what might be in buffers of different sizes is good
> > > design?
> > > > > > The FEATURE_BITMAP was introduced to get rid of this ambiguity.
> > > > >
> > > > > There is just soo much to unpack in your comment Steve, but let me
> > > > > keep it short ...
> > > > >
> > > > > - This is an enterprise distro problem, not an upstream problem.
> The
> > > > > problems you are talking about are not a problem for upstream.
> > > >
> > > > You may look at it that way. I do not. Audit -userspace is also an
> > > upstream
> > > > for a lot of distros and I need to make this painless for them. So,
> > > while you
> > > > may think of this being a backport problem for Red Hat to solve, I
> think
> > > of
> > > > this as a generic problem that I'd like to solve for Debian, Suse,
> > > Ubuntu,
> > > > Arch, Gentoo, anyone using audit. We both are upstream.
> > >
> > > I intentionally said "enterprise Linux distributions", I never singled
> > > out RH/IBM.  Contrary to what RH/IBM marketing may have me believe, I
> > > don't consider RHEL to be the only "enterprise Linux distribution" :)
> > >
> > > Beyond that, while I haven't looked at all of the distros you list
> > > above, I know a few of them typically only backport fixes, not new
> > > features.  Further, as I mentioned previously in this thread, there is
> > > a way to backport this feature in a safe manner without using the
> > > feature bits.  Eeeeeven further, if there wasn't a way to backport
> > > this feature safely (and let me stress agai that you can backport this
> > > safely), I would still consider that to be a distro problem and not an
> > > upstream kernel problem.  The upstream kernel is not responsible for
> > > enabling or supporting arbitrary combinations of patches.
> > >
> > > --
> > > paul moore
> > > www.paul-moore.com
> > >
> > > --
> > > Linux-audit mailing list
> > > Linux-audit@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-audit
> > >
> > >
> > Hi Steve, Paul,
> >
> > I'm replying with the Gmail UI since I don't have my Mutt setup handy, so
> > apologies for any formatting which doesn't align with the mailing list
> best
> >  practices!
> >
> > First off, my apologies for being late to the thread, and for submitting
> > code
> > to the kernel and user space which aren't playing nicely with each other.
> >
> > It sounds like there's a decision to be made around whether or not to use
> > the bitmap feature flags which I probably am probably not in a position
> to
> > help decide. However, I'm more than happy to fix my userspace PR so
> > that it does not rely on the feature flag space using the approach Paul
> > outlined, in spite of the drawbacks, if that ends up being the decision.
> >
> > Steve, I understand your preference to rely on the feature bitmap since
> it
> > is a more reliable way to determine the availability of a feature than
> > key size, but if you're open to Paul's recommendations in spite of the
> > drawbacks, I'll make the changes to my patch as soon as I can to unblock
> > your work.
> >
> > Separately, since there is tension between these two approaches
> > (structure size and bitmap), I wonder if Paul/Steve you would be open
> > to a third way.
>
> Max, Steve: have you looked at my reply in this thread from 2020-12-03
> 18:10?
>
> There are two solutions in there that should work without relying on the
> unreliable test for structure size that work without changing the
> currently commited kernel code.  Or have I missed something?
>
> > For example, I can imagine adding additional bitmap
> > spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).
> > Alternately, I can imagine each feature being assigned a unique u64
> > ID, and user space programs querying the kernel to see whether a
> > a particular feature is enabled.
> >
> > I'm not familiar enough with the kernel to be able to judge how sound
> > either idea is (or if these have been considered and rejected in the
> past)
> > but if you all think a third way is viable, I'd be happy to start a
> separate
> > mailing thread to try to thread the competing requirements of the kernel
> > and userspace, and contribute code if we can find a solution.
> >
> > Max
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>
>
Richard,

I missed that. That suggestion seems reasonable to me. Thanks for
the suggestion.

Steve, I'm happy to make changes to the userspace PR based on
Richard's suggestions, if that sounds good to you. I'll follow up in
the PR to discuss it more

Max

--0000000000009eb30c05b5e681b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Mon, Dec 7, 2020 at 4:21 PM Richard Guy Briggs &lt=
;<a href=3D"mailto:rgb@redhat.com">rgb@redhat.com</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 2020-12-07 16:13, Max Englander wrote:<br>
&gt; On Fri, Dec 4, 2020 at 3:41 PM Paul Moore &lt;<a href=3D"mailto:paul@p=
aul-moore.com" target=3D"_blank">paul@paul-moore.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Dec 3, 2020 at 9:47 PM Steve Grubb &lt;<a href=3D"mailto:=
sgrubb@redhat.com" target=3D"_blank">sgrubb@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt; On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Author:=C2=A0 =C2=A0 =C2=A0Richard Guy B=
riggs &lt;<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">rgb@redhat.co=
m</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; AuthorDate: 2014-11-17 15:51:01 -0500<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Commit:=C2=A0 =C2=A0 =C2=A0Paul Moore &l=
t;<a href=3D"mailto:pmoore@redhat.com" target=3D"_blank">pmoore@redhat.com<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; CommitDate: 2014-11-17 16:53:51 -0500<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; (&quot;audit: convert status version to =
a feature bitmap&quot;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; It was introduced specifically to enable=
 distributions to<br>
&gt; &gt; selectively<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; backport features.=C2=A0 It was converte=
d away from AUDIT_VERSION.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; There are other ways to detect the prese=
nce of<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; backlog_wait_time_actual<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; as I mentioned above.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Let me be blunt - I honestly don&#39;t care w=
hat Steve&#39;s audit<br>
&gt; &gt; userspace<br>
&gt; &gt; &gt; &gt; &gt; &gt; does to detect this.=C2=A0 I&#39;ve got my ow=
n opinion, but Steve&#39;s audit<br>
&gt; &gt; &gt; &gt; &gt; &gt; userspace is not my project to manage and I t=
hink we&#39;ve established<br>
&gt; &gt; &gt; &gt; &gt; &gt; over the years that Steve and I have very dif=
ferent views on what<br>
&gt; &gt; &gt; &gt; &gt; &gt; constitutes good design.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; And guessing what might be in buffers of different=
 sizes is good<br>
&gt; &gt; design?<br>
&gt; &gt; &gt; &gt; &gt; The FEATURE_BITMAP was introduced to get rid of th=
is ambiguity.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; There is just soo much to unpack in your comment Steve,=
 but let me<br>
&gt; &gt; &gt; &gt; keep it short ...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - This is an enterprise distro problem, not an upstream=
 problem.=C2=A0 The<br>
&gt; &gt; &gt; &gt; problems you are talking about are not a problem for up=
stream.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You may look at it that way. I do not. Audit -userspace is a=
lso an<br>
&gt; &gt; upstream<br>
&gt; &gt; &gt; for a lot of distros and I need to make this painless for th=
em. So,<br>
&gt; &gt; while you<br>
&gt; &gt; &gt; may think of this being a backport problem for Red Hat to so=
lve, I think<br>
&gt; &gt; of<br>
&gt; &gt; &gt; this as a generic problem that I&#39;d like to solve for Deb=
ian, Suse,<br>
&gt; &gt; Ubuntu,<br>
&gt; &gt; &gt; Arch, Gentoo, anyone using audit. We both are upstream.<br>
&gt; &gt;<br>
&gt; &gt; I intentionally said &quot;enterprise Linux distributions&quot;, =
I never singled<br>
&gt; &gt; out RH/IBM.=C2=A0 Contrary to what RH/IBM marketing may have me b=
elieve, I<br>
&gt; &gt; don&#39;t consider RHEL to be the only &quot;enterprise Linux dis=
tribution&quot; :)<br>
&gt; &gt;<br>
&gt; &gt; Beyond that, while I haven&#39;t looked at all of the distros you=
 list<br>
&gt; &gt; above, I know a few of them typically only backport fixes, not ne=
w<br>
&gt; &gt; features.=C2=A0 Further, as I mentioned previously in this thread=
, there is<br>
&gt; &gt; a way to backport this feature in a safe manner without using the=
<br>
&gt; &gt; feature bits.=C2=A0 Eeeeeven further, if there wasn&#39;t a way t=
o backport<br>
&gt; &gt; this feature safely (and let me stress agai that you can backport=
 this<br>
&gt; &gt; safely), I would still consider that to be a distro problem and n=
ot an<br>
&gt; &gt; upstream kernel problem.=C2=A0 The upstream kernel is not respons=
ible for<br>
&gt; &gt; enabling or supporting arbitrary combinations of patches.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; paul moore<br>
&gt; &gt; <a href=3D"http://www.paul-moore.com" rel=3D"noreferrer" target=
=3D"_blank">www.paul-moore.com</a><br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Linux-audit mailing list<br>
&gt; &gt; <a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux=
-audit@redhat.com</a><br>
&gt; &gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" r=
el=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo=
/linux-audit</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Hi Steve, Paul,<br>
&gt; <br>
&gt; I&#39;m replying with the Gmail UI since I don&#39;t have my Mutt setu=
p handy, so<br>
&gt; apologies for any formatting which doesn&#39;t align with the mailing =
list best<br>
&gt;=C2=A0 practices!<br>
&gt; <br>
&gt; First off, my apologies for being late to the thread, and for submitti=
ng<br>
&gt; code<br>
&gt; to the kernel and user space which aren&#39;t playing nicely with each=
 other.<br>
&gt; <br>
&gt; It sounds like there&#39;s a decision to be made around whether or not=
 to use<br>
&gt; the bitmap feature flags which I probably am probably not in a positio=
n to<br>
&gt; help decide. However, I&#39;m more than happy to fix my userspace PR s=
o<br>
&gt; that it does not rely on the feature flag space using the approach Pau=
l<br>
&gt; outlined, in spite of the drawbacks, if that ends up being the decisio=
n.<br>
&gt; <br>
&gt; Steve, I understand your preference to rely on the feature bitmap sinc=
e it<br>
&gt; is a more reliable way to determine the availability of a feature than=
<br>
&gt; key size, but if you&#39;re open to Paul&#39;s recommendations in spit=
e of the<br>
&gt; drawbacks, I&#39;ll make the changes to my patch as soon as I can to u=
nblock<br>
&gt; your work.<br>
&gt; <br>
&gt; Separately, since there is tension between these two approaches<br>
&gt; (structure size and bitmap), I wonder if Paul/Steve you would be open<=
br>
&gt; to a third way.<br>
<br>
Max, Steve: have you looked at my reply in this thread from 2020-12-03 18:1=
0?<br>
<br>
There are two solutions in there that should work without relying on the<br=
>
unreliable test for structure size that work without changing the<br>
currently commited kernel code.=C2=A0 Or have I missed something?<br>
<br>
&gt; For example, I can imagine adding additional bitmap<br>
&gt; spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).<br>
&gt; Alternately, I can imagine each feature being assigned a unique u64<br=
>
&gt; ID, and user space programs querying the kernel to see whether a<br>
&gt; a particular feature is enabled.<br>
&gt; <br>
&gt; I&#39;m not familiar enough with the kernel to be able to judge how so=
und<br>
&gt; either idea is (or if these have been considered and rejected in the p=
ast)<br>
&gt; but if you all think a third way is viable, I&#39;d be happy to start =
a separate<br>
&gt; mailing thread to try to thread the competing requirements of the kern=
el<br>
&gt; and userspace, and contribute code if we can find a solution.<br>
&gt; <br>
&gt; Max<br>
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
<br></blockquote><div><br></div><div>Richard,</div><div><br></div><div>I mi=
ssed that. That suggestion seems reasonable to me. Thanks for</div><div>the=
 suggestion.</div><div><br></div><div>Steve, I&#39;m happy to make changes =
to the userspace PR based on</div><div>Richard&#39;s suggestions, if that s=
ounds good to you. I&#39;ll follow up in</div><div>the PR to discuss it mor=
e</div><div><br></div><div>Max</div></div></div>

--0000000000009eb30c05b5e681b2--

--===============3698172154188609979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3698172154188609979==--


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F40B9E00EE
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 11:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571737354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WZi+KiJKzhFJYsxN8QY/unpq4aw6cGEOMw/obPHMCe4=;
	b=WLcS5I2F4RshlrZ33AK0nip1nO2AnQrekLXRaqxGSEyr/jnVYoZggaJJvIbJhvv6QqxEDJ
	evoCCGAAKcTxZtjfVbZt9HKb3AXGD1Uep6lpimqp+J9stWVaUKC+r4rar+qTL+SOQ/GZuT
	DDl6DMXMpCNLZI93eCmQHckZzGmQT+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-zhNoNaZ-MN-aJGr5SiV6SA-1; Tue, 22 Oct 2019 05:42:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06190800D56;
	Tue, 22 Oct 2019 09:42:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4BF5C557;
	Tue, 22 Oct 2019 09:42:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58F1C1803B58;
	Tue, 22 Oct 2019 09:42:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9M0Vst4020293 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Oct 2019 20:31:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2AC7608A5; Tue, 22 Oct 2019 00:31:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD70D60856
	for <linux-audit@redhat.com>; Tue, 22 Oct 2019 00:31:52 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4751289F301
	for <linux-audit@redhat.com>; Tue, 22 Oct 2019 00:31:51 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id x4so5274764lfn.8
	for <linux-audit@redhat.com>; Mon, 21 Oct 2019 17:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h0GVt2WTy7rJoxNXkBhE5EwsIuLJIvkg3xBSTCp/DL0=;
	b=VHnutteHj/o/AHm2vE/gKCDeK9gu7Olpsgw/xLIDGLXGnXq2HcTW84URo9ooeCNNBN
	17v8XsBnL69QZKzzTYUG2V+Tv/TuZpl7xEPs7npoNY7VqzV9bT0ghEVR7lh+A9Dh5nxT
	B7DliWr0Nq+S7iqmIp3Cva5xOZPh0uHTFv3bA5etSvzlmXkpCyl8oO/rtWUyWdvlaegQ
	xhquRnM/zYD2U9nhh1LteBiYFy5xsDtNGCEgU2wtcnH4gc1/pf/Pse/qmcc+E9fbxqmK
	nXjDT+UPE07w8p4cqwYi/odgvtWNqEpc6H0ZKK6lJAzOBjvD7+x0wFQAA6/zSotaTAe+
	aUng==
X-Gm-Message-State: APjAAAWUn4n8rn3pK/f1MiRrw3bDsM/sATN/DuilubHCtYfpWR2cBBE2
	BOsRavPJgC4JbqyiSAtdvQhxE1pSvY3HI6bLEIc9
X-Google-Smtp-Source: APXvYqw+rC5J+Z1nzHkK5AOHTkaVF47i78jP11Oa2nYpceyzoYzjRA6z6reajMuaPiEK48mkulR0rdvsnQt6ylqdK7I=
X-Received: by 2002:ac2:51b6:: with SMTP id f22mr16411765lfk.175.1571704309449;
	Mon, 21 Oct 2019 17:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
In-Reply-To: <20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Oct 2019 20:31:37 -0400
Message-ID: <CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 22 Oct 2019 00:31:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 22 Oct 2019 00:31:51 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zhNoNaZ-MN-aJGr5SiV6SA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 7:58 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-21 17:43, Paul Moore wrote:
> > On Mon, Oct 21, 2019 at 5:38 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > On 2019-10-21 15:53, Paul Moore wrote:
> > > > On Fri, Oct 18, 2019 at 9:39 PM Richard Guy Briggs <rgb@redhat.com>=
 wrote:
> > > > > On 2019-09-18 21:22, Richard Guy Briggs wrote:
> > > > > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly =
give a
> > > > > > process in a non-init user namespace the capability to set audi=
t
> > > > > > container identifiers.
> > > > > >
> > > > > > Use audit netlink message types AUDIT_GET_CAPCONTID 1027 and
> > > > > > AUDIT_SET_CAPCONTID 1028.  The message format includes the data
> > > > > > structure:
> > > > > > struct audit_capcontid_status {
> > > > > >         pid_t   pid;
> > > > > >         u32     enable;
> > > > > > };
> > > > >
> > > > > Paul, can I get a review of the general idea here to see if you'r=
e ok
> > > > > with this way of effectively extending CAP_AUDIT_CONTROL for the =
sake of
> > > > > setting contid from beyond the init user namespace where capable(=
) can't
> > > > > reach and ns_capable() is meaningless for these purposes?
> > > >
> > > > I think my previous comment about having both the procfs and netlin=
k
> > > > interfaces apply here.  I don't see why we need two different APIs =
at
> > > > the start; explain to me why procfs isn't sufficient.  If the argum=
ent
> > > > is simply the desire to avoid mounting procfs in the container, how
> > > > many container orchestrators can function today without a valid /pr=
oc?
> > >
> > > Ok, sorry, I meant to address that question from a previous patch
> > > comment at the same time.
> > >
> > > It was raised by Eric Biederman that the proc filesystem interface fo=
r
> > > audit had its limitations and he had suggested an audit netlink
> > > interface made more sense.
> >
> > I'm sure you've got it handy, so I'm going to be lazy and ask: archive
> > pointer to Eric's comments?  Just a heads-up, I'm really *not* a fan
> > of using the netlink interface for this, so unless Eric presents a
> > super compelling reason for why we shouldn't use procfs I'm inclined
> > to stick with /proc.
>
> It was actually a video call with Eric and Steve where that was
> recommended, so I can't provide you with any first-hand communication
> about it.  I'll get more details...

Yeah, that sort of information really needs to be on the list.

> So, with that out of the way, could you please comment on the general
> idea of what was intended to be the central idea of this mechanism to be
> able to nest containers beyond the initial user namespace (knowing that
> a /proc interface is available and the audit netlink interface isn't
> necessary for it to work and the latter can be easily removed)?

I'm not entirely clear what you are asking about, are you asking why I
care about nesting container orchestrators?  Simply put, it is not
uncommon for the LXC/LXD folks to see nested container orchestrators,
so I felt it was important to support that use case.  When we
originally started this effort we probably should have done a better
job reaching out to the LXC/LXD folks, we may have caught this
earlier.  Regardless, we caught it, and it looks like we are on our
way to supporting it (that's good).

Are you asking why I prefer the procfs approach to setting/getting the
audit container ID?  For one, it makes it easier for a LSM to enforce
the audit container ID operations independent of the other audit
control APIs.  It also provides a simpler interface for container
orchestrators.  Both seem like desirable traits as far as I'm
concerned.

> > > The intent was to switch to the audit netlink interface for contid,
> > > capcontid and to add the audit netlink interface for loginuid and
> > > sessionid while deprecating the proc interface for loginuid and
> > > sessionid.  This was alluded to in the cover letter, but not very cle=
ar,
> > > I'm afraid.  I have patches to remove the contid and loginuid/session=
id
> > > interfaces in another tree which is why I had forgotten to outline th=
at
> > > plan more explicitly in the cover letter.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


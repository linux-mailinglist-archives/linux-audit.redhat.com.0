Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4806718A752
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584568100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xX8VNgSwpFTfndP2beuvFRhen1zo9MLNF90SNRVoYPs=;
	b=JsYGs4axoeKfHiprNkCtsRh+WxpnQAt+Oq3CNrZrTkzr18c+sls0dRPlM4tf7Js1z5NK5V
	I/LR7uT13EK+L/D7qXdbloq4NEs4KOCWyqPNgK4cZ9xLuixf7deB2Vw+iuaPwPdYZ9Kjho
	zmJWqoj8v4tzHUH8VNwHt5q2ZfMfGbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-TvMu05g0PrmszwmafXbWaQ-1; Wed, 18 Mar 2020 17:48:18 -0400
X-MC-Unique: TvMu05g0PrmszwmafXbWaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC8D801A02;
	Wed, 18 Mar 2020 21:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A5B19756;
	Wed, 18 Mar 2020 21:48:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF7508701C;
	Wed, 18 Mar 2020 21:48:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILm4VB007571 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:48:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39FC62166AE3; Wed, 18 Mar 2020 21:48:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 361922166B29
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:48:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0735E8007B3
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:48:02 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-xkFVu1BrOqORwKTDFeLkmg-1; Wed, 18 Mar 2020 17:47:59 -0400
X-MC-Unique: xkFVu1BrOqORwKTDFeLkmg-1
Received: by mail-ed1-f67.google.com with SMTP id dc19so32760082edb.10
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jSbmM7deMijcGQ2Njr0obFK5q42A00wv1XC6bXtNHSs=;
	b=OoYz42GTxjqvO48Yphcvn8exua4+n2+whw72YmHVz5erHtfF7HsRrIvYWTolYQzmS1
	oFxgjIZ1UFw4RRvFnV5l/QHGYWuU98OdM6yq/6YlO2auDd8knobAu2mm0gGnzPrbAoAG
	fooWdbHEPVJbHc5Iyoc4iJ5D1v7ts5rFazo/CEEOOXjAoYr+BlXtfpCRiF9wGP/ppxuu
	DDiM1DOQF/XvVMTrX227gMii1l03SPvKqrnP5VzvyiITPzaWraFbtScMvvC6XA9WF6mb
	nu8hC2/85CgEI/qlKlRFCaToSOoW9MCaQbYhk2dmqOdaZKEE/gK4Ml14ugNFEz0kqu4d
	UxoQ==
X-Gm-Message-State: ANhLgQ2GyAnv8pFC29ZG7EITxfj8K6DHgHL72xNJ883NRd8Rz6H1Tmqn
	JXZejq9tQGOVu48fZSo8qw4wA9Q7r/VLkxavNQIY
X-Google-Smtp-Source: ADFU+vv/EY9M8GK0pcJMqD/OH+jUGrRWl+6JVHzUqMMHKF9wP/wDKGvAN8gqZuvjirieWXrnqF8sYPlcMloCLTpwSog=
X-Received: by 2002:a17:906:7a46:: with SMTP id i6mr281388ejo.95.1584568078394;
	Wed, 18 Mar 2020 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
	<20200313192306.wxey3wn2h4htpccm@madcap2.tricolour.ca>
	<CAHC9VhQKOpVWxDg-tWuCWV22QRu8P_NpFKme==0Ot1RQKa_DWA@mail.gmail.com>
	<20200318214154.ycxy5dl4pxno6fvi@madcap2.tricolour.ca>
In-Reply-To: <20200318214154.ycxy5dl4pxno6fvi@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:47:47 -0400
Message-ID: <CAHC9VhSuMnd3-ci2Bx-xJ0yscQ=X8ZqFAcNPKpbh_ZWN3FJcuQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ILm4VB007571
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2020 at 5:42 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-18 17:01, Paul Moore wrote:
> > On Fri, Mar 13, 2020 at 3:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-13 12:42, Paul Moore wrote:
> >
> > ...
> >
> > > > The thread has had a lot of starts/stops, so I may be repeating a
> > > > previous suggestion, but one idea would be to still emit a "death
> > > > record" when the final task in the audit container ID does die, but
> > > > block the particular audit container ID from reuse until it the
> > > > SIGNAL2 info has been reported.  This gives us the timely ACID death
> > > > notification while still preventing confusion and ambiguity caused by
> > > > potentially reusing the ACID before the SIGNAL2 record has been sent;
> > > > there is a small nit about the ACID being present in the SIGNAL2
> > > > *after* its death, but I think that can be easily explained and
> > > > understood by admins.
> > >
> > > Thinking quickly about possible technical solutions to this, maybe it
> > > makes sense to have two counters on a contobj so that we know when the
> > > last process in that container exits and can issue the death
> > > certificate, but we still block reuse of it until all further references
> > > to it have been resolved.  This will likely also make it possible to
> > > report the full contid chain in SIGNAL2 records.  This will eliminate
> > > some of the issues we are discussing with regards to passing a contobj
> > > vs a contid to the audit_log_contid function, but won't eliminate them
> > > all because there are still some contids that won't have an object
> > > associated with them to make it impossible to look them up in the
> > > contobj lists.
> >
> > I'm not sure you need a full second counter, I imagine a simple flag
> > would be okay.  I think you just something to indicate that this ACID
> > object is marked as "dead" but it still being held for sanity reasons
> > and should not be reused.
>
> Ok, I see your point.  This refcount can be changed to a flag easily
> enough without change to the api if we can be sure that more than one
> signal can't be delivered to the audit daemon *and* collected by sig2.
> I'll have a more careful look at the audit daemon code to see if I can
> determine this.

Maybe I'm not understanding your concern, but this isn't really
different than any of the other things we track for the auditd signal
sender, right?  If we are worried about multiple signals being sent
then it applies to everything, not just the audit container ID.

> Another question occurs to me is that what if the audit daemon is sent a
> signal and it cannot or will not collect the sig2 information from the
> kernel (SIGKILL?)?  Does that audit container identifier remain dead
> until reboot, or do we institute some other form of reaping, possibly
> time-based?

In order to preserve the integrity of the audit log that ACID value
would need to remain unavailable until the ACID which contains the
associated auditd is "dead" (no one can request the signal sender's
info if that container is dead).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


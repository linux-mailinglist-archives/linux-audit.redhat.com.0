Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CCE67196AD2
	for <lists+linux-audit@lfdr.de>; Sun, 29 Mar 2020 05:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585451873;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YXABrxXpj2eEH7c2RGvUl321DLdlfuwbkQYmQMmKTHk=;
	b=He/YGsxQX+Fam/uYxrsnUAzLFlph2nfccLXjeBaG6CEM1gNjmoHJsImPMhLNT5mDQjq6rh
	j6X1KtPFTMaqdE9NOLMne7bWjVTg8YdEuHYnQoO5Zz0eF2ZCtG/JN0I3aIEVaPhvp+khNx
	5XTtdxfRoo+xtxe8iioUF+8Cp5inmnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-lMbuX83CMmmSxjvEqZ-nhA-1; Sat, 28 Mar 2020 23:17:51 -0400
X-MC-Unique: lMbuX83CMmmSxjvEqZ-nhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0322D107ACC7;
	Sun, 29 Mar 2020 03:17:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97C45C1C3;
	Sun, 29 Mar 2020 03:17:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79075942AD;
	Sun, 29 Mar 2020 03:17:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02T3HWkX024565 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 28 Mar 2020 23:17:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A692110EE824; Sun, 29 Mar 2020 03:17:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D0D1006B26
	for <linux-audit@redhat.com>; Sun, 29 Mar 2020 03:17:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA710800297
	for <linux-audit@redhat.com>; Sun, 29 Mar 2020 03:17:30 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-p5eZlSTsOB2LG8pqtR4c5Q-1; Sat, 28 Mar 2020 23:17:28 -0400
X-MC-Unique: p5eZlSTsOB2LG8pqtR4c5Q-1
Received: by mail-ed1-f65.google.com with SMTP id bd14so16651214edb.10
	for <linux-audit@redhat.com>; Sat, 28 Mar 2020 20:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=73jM7UJ1SiInp3qgWBqwVopBoGUW8da3yGoLPO2s510=;
	b=GkUV7f4/9+QhwuDaqX8/YYXy4dym4qUjq62Aw5BuF/jOtNNFAFp2geCPUnforhiAPA
	Y9/z1XajUd67OlTHcklafQIFZhG68sTvmomuvwF/JLky4KD2aYOzFKNfH8Lw/HMn6isL
	HtqvQtAc0/rX6OKzk+kG0fd576LRw7qVfxncB2n71EsqEGBNY8vj3wWySOB50F7bNQvo
	Z7WtQqOTcB/nNBaxnF4KCs1+IQUdkZM7WvRDiSBPEewRGDb+Omvrgz6jcf3Jm1deOjAx
	ZvvICinEluvKJOMXg8FqsHyDaA55YP8YmDptW4t8EjlY0xrvTcHfXjQTOEAR3rB+bXw4
	up9g==
X-Gm-Message-State: ANhLgQ2YqFk62fpEsRq5pXnMAaV4xdNL9oN7E2Qr/FpaKf53mxbPXVjb
	P1OOJ6E3mm3HFTbj2i0p4ZUF3WtfShrLqkhgHrCY
X-Google-Smtp-Source: ADFU+vv/MFU+PUL6L3fWaCWJ+SsYWlwfM5jrj3x9inQIKOJr3keTEJ5GXU9ljVx28Cw+08JkBWPGuLw/MRT/qz+R/UQ=
X-Received: by 2002:aa7:d2cb:: with SMTP id k11mr6032886edr.128.1585451846873; 
	Sat, 28 Mar 2020 20:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
	<20200313192306.wxey3wn2h4htpccm@madcap2.tricolour.ca>
	<CAHC9VhQKOpVWxDg-tWuCWV22QRu8P_NpFKme==0Ot1RQKa_DWA@mail.gmail.com>
	<20200318214154.ycxy5dl4pxno6fvi@madcap2.tricolour.ca>
	<CAHC9VhSuMnd3-ci2Bx-xJ0yscQ=X8ZqFAcNPKpbh_ZWN3FJcuQ@mail.gmail.com>
	<20200319214759.qgxt2sfkmd6srdol@madcap2.tricolour.ca>
	<CAHC9VhTp25OAaTO5UMft0OzUZ=oQpZFjebkjjQP0-NrPp0bNAg@mail.gmail.com>
	<20200325122903.obkpyog7fjabzrpf@madcap2.tricolour.ca>
In-Reply-To: <20200325122903.obkpyog7fjabzrpf@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 28 Mar 2020 23:17:15 -0400
Message-ID: <CAHC9VhTuYYqAtoNAKLX3qja6DnqEbFuHchi9ESwbcb5WC_Mvtw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02T3HWkX024565
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 25, 2020 at 8:29 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-20 17:56, Paul Moore wrote:
> > On Thu, Mar 19, 2020 at 5:48 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-18 17:47, Paul Moore wrote:
> > > > On Wed, Mar 18, 2020 at 5:42 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2020-03-18 17:01, Paul Moore wrote:
> > > > > > On Fri, Mar 13, 2020 at 3:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > > > On 2020-03-13 12:42, Paul Moore wrote:
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > > The thread has had a lot of starts/stops, so I may be repeating a
> > > > > > > > previous suggestion, but one idea would be to still emit a "death
> > > > > > > > record" when the final task in the audit container ID does die, but
> > > > > > > > block the particular audit container ID from reuse until it the
> > > > > > > > SIGNAL2 info has been reported.  This gives us the timely ACID death
> > > > > > > > notification while still preventing confusion and ambiguity caused by
> > > > > > > > potentially reusing the ACID before the SIGNAL2 record has been sent;
> > > > > > > > there is a small nit about the ACID being present in the SIGNAL2
> > > > > > > > *after* its death, but I think that can be easily explained and
> > > > > > > > understood by admins.
> > > > > > >
> > > > > > > Thinking quickly about possible technical solutions to this, maybe it
> > > > > > > makes sense to have two counters on a contobj so that we know when the
> > > > > > > last process in that container exits and can issue the death
> > > > > > > certificate, but we still block reuse of it until all further references
> > > > > > > to it have been resolved.  This will likely also make it possible to
> > > > > > > report the full contid chain in SIGNAL2 records.  This will eliminate
> > > > > > > some of the issues we are discussing with regards to passing a contobj
> > > > > > > vs a contid to the audit_log_contid function, but won't eliminate them
> > > > > > > all because there are still some contids that won't have an object
> > > > > > > associated with them to make it impossible to look them up in the
> > > > > > > contobj lists.
> > > > > >
> > > > > > I'm not sure you need a full second counter, I imagine a simple flag
> > > > > > would be okay.  I think you just something to indicate that this ACID
> > > > > > object is marked as "dead" but it still being held for sanity reasons
> > > > > > and should not be reused.
> > > > >
> > > > > Ok, I see your point.  This refcount can be changed to a flag easily
> > > > > enough without change to the api if we can be sure that more than one
> > > > > signal can't be delivered to the audit daemon *and* collected by sig2.
> > > > > I'll have a more careful look at the audit daemon code to see if I can
> > > > > determine this.
> > > >
> > > > Maybe I'm not understanding your concern, but this isn't really
> > > > different than any of the other things we track for the auditd signal
> > > > sender, right?  If we are worried about multiple signals being sent
> > > > then it applies to everything, not just the audit container ID.
> > >
> > > Yes, you are right.  In all other cases the information is simply
> > > overwritten.  In the case of the audit container identifier any
> > > previous value is put before a new one is referenced, so only the last
> > > signal is kept.  So, we only need a flag.  Does a flag implemented with
> > > a rcu-protected refcount sound reasonable to you?
> >
> > Well, if I recall correctly you still need to fix the locking in this
> > patchset so until we see what that looks like it is hard to say for
> > certain.  Just make sure that the flag is somehow protected from
> > races; it is probably a lot like the "valid" flags you sometimes see
> > with RCU protected lists.
>
> This is like looking for a needle in a haystack.  Can you point me to
> some code that does "valid" flags with RCU protected lists.

Sigh.  Come on Richard, you've been playing in the kernel for some
time now.  I can't think of one off the top of my head as I write
this, but there are several resources that deal with RCU protected
lists in the kernel, Google is your friend and Documentation/RCU is
your friend.

Spending time to learn how RCU works and how to use it properly is not
time wasted.  It's a tricky thing to get right (I have to refresh my
memory on some of the more subtle details each time I write/review RCU
code), but it's very cool when done correctly.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


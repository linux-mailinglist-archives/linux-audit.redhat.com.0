Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 953C318A578
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584565321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ONg/+At+TYVQABxPSh8lRz7St5XXAVAqR0s4RZqvEzQ=;
	b=J/P3evMgqLVnZe1rJJUbv9gcSwO626frNNcgdkUj+Bttm2wV6cLCk8rD7coRpCROqGA8Ga
	VBM0ivAcM0X+Zv6RCoQiF4oXqgAhhYT+J9uSD49bzo9Bs/Be7cRe+iElRAeH73qkBlXnOV
	C3JXUzB4sQYT4MrTIW9A/TgaPydaJm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-jCPCEaXbNLCeamgxi-0bbA-1; Wed, 18 Mar 2020 17:01:55 -0400
X-MC-Unique: jCPCEaXbNLCeamgxi-0bbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7677C477;
	Wed, 18 Mar 2020 21:01:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267AA19757;
	Wed, 18 Mar 2020 21:01:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65F7A87013;
	Wed, 18 Mar 2020 21:01:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IL1hob006027 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:01:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 294692022EA5; Wed, 18 Mar 2020 21:01:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A162022EAD
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:01:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D12A7185A78E
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:01:40 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-aJFZ1A4TMau0HWooyuJ9pA-1; Wed, 18 Mar 2020 17:01:38 -0400
X-MC-Unique: aJFZ1A4TMau0HWooyuJ9pA-1
Received: by mail-ed1-f65.google.com with SMTP id b21so22290326edy.9
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h1JVSDR71Ka3PM04u0ramfobv1CKoUTWgjm5qfW2CV8=;
	b=dxIpKNKEFNO5g/97FCXzXHlUKiikqwqVjTIIowciMGy9hrhPkJkbiqRnaOshjDVA1x
	IcnG8vbldyprr2LCKZsc0asQNSct2KW6WpNjv5JE+w3cB/7BqTYvsFgb6LmXAkrn/8pw
	/3kvliwMWXJgr0/EdhVZ9AOjZMTIzOEJjZDgQiE9PgknjQdXqZHilFI6+lKIE/uhvgZq
	H5ClPPcsD5QXF3CZ3+gbrfheFfsKwVVLgmwcfFy9yrNYYA41S2A+/gZGXF7mDoouLsGQ
	NdMxr9RAUwe+hvIQ66ocBcRSBfjZqrKGSw4SZCp7e+WN8FOlBe9VDOdpf7DRP8pIRjL0
	aetg==
X-Gm-Message-State: ANhLgQ1yr0GAW1SAKQn32CC8CzWFHi3c/Q5eEJ8iapPbHI9fbJDapatf
	04+yzao01uLhpkLiWLbvjV17WqxOTTCln7xzeOnm
X-Google-Smtp-Source: ADFU+vtjoB1L41gbvG3IfZm3ksBmDTvbqLdnYvpmD27Ya9UPhKm77W68IFm4/AxRz3i7hA2sUofnKwQPP6SAVhHtg78=
X-Received: by 2002:a05:6402:8c3:: with SMTP id
	d3mr5966134edz.31.1584565297053; 
	Wed, 18 Mar 2020 14:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
	<20200313192306.wxey3wn2h4htpccm@madcap2.tricolour.ca>
In-Reply-To: <20200313192306.wxey3wn2h4htpccm@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:01:26 -0400
Message-ID: <CAHC9VhQKOpVWxDg-tWuCWV22QRu8P_NpFKme==0Ot1RQKa_DWA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02IL1hob006027
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

On Fri, Mar 13, 2020 at 3:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-13 12:42, Paul Moore wrote:

...

> > The thread has had a lot of starts/stops, so I may be repeating a
> > previous suggestion, but one idea would be to still emit a "death
> > record" when the final task in the audit container ID does die, but
> > block the particular audit container ID from reuse until it the
> > SIGNAL2 info has been reported.  This gives us the timely ACID death
> > notification while still preventing confusion and ambiguity caused by
> > potentially reusing the ACID before the SIGNAL2 record has been sent;
> > there is a small nit about the ACID being present in the SIGNAL2
> > *after* its death, but I think that can be easily explained and
> > understood by admins.
>
> Thinking quickly about possible technical solutions to this, maybe it
> makes sense to have two counters on a contobj so that we know when the
> last process in that container exits and can issue the death
> certificate, but we still block reuse of it until all further references
> to it have been resolved.  This will likely also make it possible to
> report the full contid chain in SIGNAL2 records.  This will eliminate
> some of the issues we are discussing with regards to passing a contobj
> vs a contid to the audit_log_contid function, but won't eliminate them
> all because there are still some contids that won't have an object
> associated with them to make it impossible to look them up in the
> contobj lists.

I'm not sure you need a full second counter, I imagine a simple flag
would be okay.  I think you just something to indicate that this ACID
object is marked as "dead" but it still being held for sanity reasons
and should not be reused.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


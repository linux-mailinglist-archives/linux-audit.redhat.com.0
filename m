Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5DA52FC2C3
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 22:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611093215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ycfgJi5mFxAe7Z76gNOANV/gEJUavSFB+r89JeuWXK8=;
	b=hwn73Q1+QE+H+JANH0lhyzE1EC3jc5jIBuH3o+DdHiyKs/ix/6Ol0EuGXOxYX2aheJjbUb
	T7Z77HT46YuY4+rxKLb+EfVrLMdTdc4uujUVorzhVctcgBe6mw/iSpVSeHufL8KVyekfzp
	jVCqReh+TvDef/RwythJkbDwQ+DmdFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-UfrcyWqyN4W_oCkdb_BFjQ-1; Tue, 19 Jan 2021 16:53:31 -0500
X-MC-Unique: UfrcyWqyN4W_oCkdb_BFjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB16F806660;
	Tue, 19 Jan 2021 21:53:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7554D6A8E9;
	Tue, 19 Jan 2021 21:53:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94E7E4BB7B;
	Tue, 19 Jan 2021 21:53:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JLpEXg005094 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 16:51:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE82369320; Tue, 19 Jan 2021 21:51:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-90.rdu2.redhat.com [10.10.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CBC2629C0;
	Tue, 19 Jan 2021 21:51:08 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org, Paul Moore <paul@paul-moore.com>
Subject: Re: Occasional delayed output of events
Date: Tue, 19 Jan 2021 16:51:08 -0500
Message-ID: <805552026.0ifERbkFSE@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<9fd0d1b4585214eb3ed8db6da066b571563f19bc.camel@iinet.net.au>
	<CAHC9VhQzr94BdBY3voNEMxzBPM-KS3h1V=epCMMsknfu6Q5vag@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, January 19, 2021 3:26:04 PM EST Paul Moore wrote:
> On Tue, Jan 19, 2021 at 2:38 PM Burn Alting <burn.alting@iinet.net.au> 
wrote:
> > All systems use chrony (current NTP daemon). One is a VM (on top of KVM)
> > and the other a bare metal deployment. Does the above explain my second
> > data set (in the issue) from a bare metal Centos 8 host? Perhaps Lenny's
> > comments bare investigation. Either way, I will offer a patch to the
> > user space code to, based on a configuration value, manage correctly
> > such activity.
> ...
> 
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609921000.636:1787850):
> > msg=audit(1609921000.636:1787850):
> > msg=audit(1609921000.636:1787850):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609921008.456:1787851):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609921010.837:1787852):
> > msg=audit(1609921010.837:1787852):
> > msg=audit(1609921010.837:1787852):
> 
> > msg=audit(1609921010.837:1787852):
> Looking at the extracted snippet above where event 1787849 is out of
> 
> order we see the following timestamps:
> > msg=audit(1609920994.483:1787848):
> > msg=audit(1609920994.484:1787849):
> > msg=audit(1609921000.636:1787850):
> > msg=audit(1609921008.456:1787851):
> 
> > msg=audit(1609921010.837:1787852):
>
> ... which looks correct in as much that the time doesn't appear to go
> backwards between events.  As I said before, I'm not sure how Steve's
> userspace works so the time may be a red herring.

It only handles one record at a time. No chance to mix things up.

The github issue says that 30-stig.rules is being used. If the system time 
changed with chrony, I would expect syscall events with adjtimex. But the 
only ones given are execve.

-Steve

> Barring some weird condition where auditd disconnects and quickly
> reconnects to the kernel, and/or dies and is replaced quickly, I'm not
> seeing anything obvious in the kernel which would cause this.  I'm not
> saying there isn't anything there, just that it isn't obvious to me at
> the moment :)




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


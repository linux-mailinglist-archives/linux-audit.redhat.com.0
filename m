Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C828E6A0
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 20:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602701116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/dLgCx8+OPavHdpLxbBnE6SqMB7c1PoOy8wQdrRKt8g=;
	b=ho3HnGZGpHrP83wEYFRiBGqF1vLydPggcvydSLCGwYcuOXTCEVlm7nFwdHaYVI7MZbT7bv
	KYH/5duv9y5KU4w6BXba/iYZcatO+oRqu082wdZB1OqjO36X2vmQA7LtPJAfOzEkQ3JLkV
	S+3WOF2U0r7YtPtMu/2/lRi524hN68Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-cDekIcJtPreXOPMc5yLH9w-1; Wed, 14 Oct 2020 14:45:12 -0400
X-MC-Unique: cDekIcJtPreXOPMc5yLH9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7B41074644;
	Wed, 14 Oct 2020 18:45:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6CD5D9CD;
	Wed, 14 Oct 2020 18:45:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA2D192F25;
	Wed, 14 Oct 2020 18:45:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EIivW0011757 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 14:44:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33A0D55765; Wed, 14 Oct 2020 18:44:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-216.rdu2.redhat.com [10.10.114.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D12637513A;
	Wed, 14 Oct 2020 18:44:51 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: Re: How to confirm AUDITD is immutable
Date: Wed, 14 Oct 2020 14:44:50 -0400
Message-ID: <5564867.MhkbZ0Pkbq@x2>
Organization: Red Hat
In-Reply-To: <CAJdJdQmPhUY0fSUp5eakf_up3nnGB1_4FLHexLvtbkCuEo-e2g@mail.gmail.com>
References: <CAJdJdQmPhUY0fSUp5eakf_up3nnGB1_4FLHexLvtbkCuEo-e2g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, October 14, 2020 2:30:48 PM EDT warron.french wrote:
> Hello, I just wanted to confirm for my memory that if I wanted to confirm
> that the auditd process running on my system was configured correctly and
> intended to be
> *immutable (*setting *-e 2*) I would do so easily by executing:
> 
> *auditctl -s*
> 
> When I execute that command I get back in the results that have:
> *enabled 1*
> *loginuid_immutable 0 unlocked*
> *among a few other lines.*
> 
> Shouldn't I actually see *enabled 2*?

That's what I get.

# auditctl -s
enabled 2


> I have in one of our .rules files under /etc/audit/rules.d/ the syntax
> "-e 2".

I'd copy 99-finalize.rules to rules.d and uncomment the only rule in the file. 
It has to be last. Although I have no idea why what you have isn't working 
unless its not getting picked up by augenrules.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


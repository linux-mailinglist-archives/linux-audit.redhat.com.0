Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B2B1B1FA37D
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 00:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592259850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SMh+sFT9Xq1nYlimnBghQrQdqSVhDzz8gU3GFJp5wo4=;
	b=P+DNgaIXXoVa7vIP5t+BQnNzF1R4UZRpSr33FZUzIdPpIOL5k0ZN1OrNgl6gWE1rZs/IxA
	m5s59xrHl2vsOkM6Qg9cV2viwD+b0GTzmXX2z6yHvF304oh2C6dFA+IpCcuzuJ/KBRn4xO
	H5l7e4DZs9xBn7/X2oorFusYAJd9MBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-FR5GewbvND-7RuPoWBC70A-1; Mon, 15 Jun 2020 18:24:07 -0400
X-MC-Unique: FR5GewbvND-7RuPoWBC70A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17D721091322;
	Mon, 15 Jun 2020 22:24:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC97100238E;
	Mon, 15 Jun 2020 22:23:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A8E31809547;
	Mon, 15 Jun 2020 22:23:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05FMNcWO006410 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 18:23:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1FB1000329; Mon, 15 Jun 2020 22:23:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-75.phx2.redhat.com [10.3.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E48F10002BC;
	Mon, 15 Jun 2020 22:23:31 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
Date: Mon, 15 Jun 2020 18:23:31 -0400
Message-ID: <8800031.dr63W5FlUW@x2>
Organization: Red Hat
In-Reply-To: <42482562-d74c-2678-069f-1d8ef4feffac@linux.microsoft.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<1591989920.11061.90.camel@linux.ibm.com>
	<42482562-d74c-2678-069f-1d8ef4feffac@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, June 12, 2020 3:50:14 PM EDT Lakshmi Ramasubramanian wrote:
> On 6/12/20 12:25 PM, Mimi Zohar wrote:
> > The idea is a good idea, but you're assuming that "result" is always
> > errno.  That was probably true originally, but isn't now.  For
> > example, ima_appraise_measurement() calls xattr_verify(), which
> > compares the security.ima hash with the calculated file hash.  On
> > failure, it returns the result of memcmp().  Each and every code path
> > will need to be checked.
> 
> Good catch Mimi.
> 
> Instead of "errno" should we just use "result" and log the value given
> in the result parameter?

That would likely collide with another field of the same name which is the 
operation's results. If it really is errno, the name is fine. It's generic 
enough that it can be reused on other events if that mattered.


>  From the audit field dictionary (link given below) "result" is already
> a known field that is used to indicate the result of the audited operation.
> 
> @Steve\Paul:
> Like "res" is "result" also expected to have only values "0" or "1", or
> can it be any result code?

It should only be 0 or 1. Sometime in the past it may have been the words 
success/fail. But we've been converting those as we find them.

-Steve

> https://github.com/linux-audit/audit-documentation/blob/master/specs/fields
> /field-dictionary.csv
> 
> res 	alphanumeric 	result of the audited operation(success/fail)
> 
> result 	alphanumeric 	result of the audited operation(success/fail)




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


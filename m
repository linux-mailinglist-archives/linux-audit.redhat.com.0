Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 187012FDC03
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 22:41:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-eIkIsgHWPnWPf_Mk01C_3g-1; Wed, 20 Jan 2021 16:41:37 -0500
X-MC-Unique: eIkIsgHWPnWPf_Mk01C_3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529CA1005D44;
	Wed, 20 Jan 2021 21:41:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 348612D02A;
	Wed, 20 Jan 2021 21:41:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED5504A7C6;
	Wed, 20 Jan 2021 21:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KLdL4H002377 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 16:39:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5202F2026D15; Wed, 20 Jan 2021 21:39:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD902026D11
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 21:39:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43615811E76
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 21:39:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-269-KzqfyY5zOPOBucYqBdSlBw-1;
	Wed, 20 Jan 2021 16:39:15 -0500
X-MC-Unique: KzqfyY5zOPOBucYqBdSlBw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0CDEEAB9F;
	Wed, 20 Jan 2021 21:39:14 +0000 (UTC)
Date: Wed, 20 Jan 2021 18:39:11 -0300
From: Enzo Matsumiya <ematsumiya@suse.de>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [RFC] audit.spec: create audit group for log read access
Message-ID: <20210120213911.32v27lqeqhrdm53i@hyori>
References: <20210120175224.dchx7f6z6i2bslst@hyori>
 <5439988.DvuYhMxLoT@x2>
MIME-Version: 1.0
In-Reply-To: <5439988.DvuYhMxLoT@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 01/20, Steve Grubb wrote:
>This might go against the DISA STIG, but otherwise this is using the audit
>system as intended.

Ah yes, you're right. I checked and it seems so for RH, but not for SUSE.
Good catch, though.

>I consider the audit.spec file to be an example to help others with packaging.
>But I'm not entirely sure if it's 100% in sync with Fedora since they make
>arbitrary policy changes like removing gcc and make from the build root which
>then causes specfile updates. If you want to submit a patch, feel free. I
>would apply it as an example to others.

Thanks. We also have some modifications to the specfile.

So what I'm getting from your reply is it's up to the OS vendor to provide,
or not, such modification -- i.e. it's more of a general OS problem than audit's
problem. Is that correct?

>Best Regards,
>-Steve


Cheers,

Enzo

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 23543231EB0
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 14:40:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-cQAI24NjNV2o1bIG6mPDXw-1; Wed, 29 Jul 2020 08:40:53 -0400
X-MC-Unique: cQAI24NjNV2o1bIG6mPDXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE35A108E;
	Wed, 29 Jul 2020 12:40:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CE461176;
	Wed, 29 Jul 2020 12:40:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56C181800B6C;
	Wed, 29 Jul 2020 12:40:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SNtfwo005739 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:55:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBE3C8057B; Tue, 28 Jul 2020 23:55:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6EC78A4DD
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:55:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637258EF3A5
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:55:37 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-181-k2m29oz5MvaFpSx42w2ESw-1;
	Tue, 28 Jul 2020 19:55:33 -0400
X-MC-Unique: k2m29oz5MvaFpSx42w2ESw-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id 206D720B4908;
	Tue, 28 Jul 2020 16:55:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 206D720B4908
Subject: Re: [RFC PATCH v5 05/11] fs: add security blob and hooks for
	block_device
To: Al Viro <viro@zeniv.linux.org.uk>, Casey Schaufler <casey@schaufler-ca.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-6-deven.desai@linux.microsoft.com>
	<ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
	<20200728224003.GC951209@ZenIV.linux.org.uk>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <f6bda37a-e6f8-3de9-2bae-25d2296f3424@linux.microsoft.com>
Date: Tue, 28 Jul 2020 16:55:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728224003.GC951209@ZenIV.linux.org.uk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 Jul 2020 08:39:41 -0400
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	corbet@lwn.net, jmorris@namei.org, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, axboe@kernel.dk,
	mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 7/28/2020 3:40 PM, Al Viro wrote:
> On Tue, Jul 28, 2020 at 03:22:59PM -0700, Casey Schaufler wrote:
> 
>>> +	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
>>> +		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
>>> +
>>> +		if (rc == -ENOSYS)
>>> +			rc = 0;
>>> +
>>> +		if (rc != 0)
>>
>> Perhaps:
>> 		else if (rc != 0)
>>
>>> +			break;
>>> +	}
>>> +
>>> +	return rc;
> 
> 	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
> 		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
> 		if (rc && rc != -ENOSYS)
> 			return rc;
> 	}
> 	return 0;
> 
> Easier to reason about that way...
> 

Yeah, this is cleaner. I'll make the change for v6.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


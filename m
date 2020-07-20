Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8AB226C33
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 18:48:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-FD_4OjcHMPeRgtxt6NGBgQ-1; Mon, 20 Jul 2020 12:48:00 -0400
X-MC-Unique: FD_4OjcHMPeRgtxt6NGBgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32919100A8E7;
	Mon, 20 Jul 2020 16:47:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D22F60F8D;
	Mon, 20 Jul 2020 16:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 900279A155;
	Mon, 20 Jul 2020 16:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KGiC26013057 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 12:44:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 162062156709; Mon, 20 Jul 2020 16:44:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1147F2156A4D
	for <linux-audit@redhat.com>; Mon, 20 Jul 2020 16:44:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 602021832D21
	for <linux-audit@redhat.com>; Mon, 20 Jul 2020 16:44:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-434-zHQEUUQMOf2jq9kWS69ZqQ-1;
	Mon, 20 Jul 2020 12:44:04 -0400
X-MC-Unique: zHQEUUQMOf2jq9kWS69ZqQ-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id 67F2E20B4909;
	Mon, 20 Jul 2020 09:44:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 67F2E20B4909
Subject: Re: [RFC PATCH v4 02/12] security: add ipe lsm evaluation loop and
	audit system
To: Randy Dunlap <rdunlap@infradead.org>, agk@redhat.com, axboe@kernel.dk,
	snitzer@redhat.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, viro@zeniv.linux.org.uk, paul@paul-moore.com,
	eparis@redhat.com, jannh@google.com, dm-devel@redhat.com,
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-audit@redhat.com
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
	<20200717230941.1190744-3-deven.desai@linux.microsoft.com>
	<4b0c9925-d163-46a2-bbcb-74deb7446540@infradead.org>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <f7cda924-a14d-35bf-7c00-f12e2be9844c@linux.microsoft.com>
Date: Mon, 20 Jul 2020 09:44:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b0c9925-d163-46a2-bbcb-74deb7446540@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 12:47:34 -0400
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
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



On 7/17/2020 4:16 PM, Randy Dunlap wrote:
> On 7/17/20 4:09 PM, Deven Bowers wrote:
>> +config SECURITY_IPE_PERMISSIVE_SWITCH
>> +	bool "Enable the ability to switch IPE to permissive mode"
>> +	default y
>> +	help
>> +	  This option enables two ways of switching IPE to permissive mode,
>> +	  a sysctl (if enabled), `ipe.enforce`, or a kernel command line
>> +	  parameter, `ipe.enforce`. If either of these are set to 0, files
> 
> 	                                               is set

Thanks, I'll change it in the next iteration.

> 
>> +	  will be subject to IPE's policy, audit messages will be logged, but
>> +	  the policy will not be enforced.
>> +
>> +	  If unsure, answer Y.
> 
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


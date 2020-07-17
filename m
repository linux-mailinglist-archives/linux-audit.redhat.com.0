Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CBF0A226090
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:18:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-2F3fVMKUPeyKrrnYb145vQ-1; Mon, 20 Jul 2020 09:18:41 -0400
X-MC-Unique: 2F3fVMKUPeyKrrnYb145vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546DB1DE3;
	Mon, 20 Jul 2020 13:18:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 327222DE72;
	Mon, 20 Jul 2020 13:18:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F062E9A158;
	Mon, 20 Jul 2020 13:18:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06I0FtI7008523 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 20:15:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DE4D2018283; Sat, 18 Jul 2020 00:15:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A17D201828A
	for <linux-audit@redhat.com>; Sat, 18 Jul 2020 00:15:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38AA80CC2C
	for <linux-audit@redhat.com>; Sat, 18 Jul 2020 00:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-191--igrCGGaO3-H8uX-iWoXoQ-1; Fri, 17 Jul 2020 20:15:48 -0400
X-MC-Unique: -igrCGGaO3-H8uX-iWoXoQ-1
Received: from [2601:1c0:6280:3f0::19c2]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwZb2-0005Vh-Az; Fri, 17 Jul 2020 23:16:52 +0000
Subject: Re: [RFC PATCH v4 02/12] security: add ipe lsm evaluation loop and
	audit system
To: Deven Bowers <deven.desai@linux.microsoft.com>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
	<20200717230941.1190744-3-deven.desai@linux.microsoft.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4b0c9925-d163-46a2-bbcb-74deb7446540@infradead.org>
Date: Fri, 17 Jul 2020 16:16:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717230941.1190744-3-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:18:19 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/17/20 4:09 PM, Deven Bowers wrote:
> +config SECURITY_IPE_PERMISSIVE_SWITCH
> +	bool "Enable the ability to switch IPE to permissive mode"
> +	default y
> +	help
> +	  This option enables two ways of switching IPE to permissive mode,
> +	  a sysctl (if enabled), `ipe.enforce`, or a kernel command line
> +	  parameter, `ipe.enforce`. If either of these are set to 0, files

	                                               is set

> +	  will be subject to IPE's policy, audit messages will be logged, but
> +	  the policy will not be enforced.
> +
> +	  If unsure, answer Y.


-- 
~Randy

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


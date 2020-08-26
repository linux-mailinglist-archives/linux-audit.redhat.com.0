Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5B92537C5
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 21:02:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-39GvnVuCOgarY7SeVrSFcA-1; Wed, 26 Aug 2020 15:02:29 -0400
X-MC-Unique: 39GvnVuCOgarY7SeVrSFcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4510A1DE01;
	Wed, 26 Aug 2020 19:02:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 745CB1002D41;
	Wed, 26 Aug 2020 19:02:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FE8660376;
	Wed, 26 Aug 2020 19:02:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QIl5ZH005309 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 14:47:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB1C22156A30; Wed, 26 Aug 2020 18:47:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6AC72156A23
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 18:47:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0A2680121C
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 18:47:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-338-GXajaslgMzOt24gSl8jc8w-1; Wed, 26 Aug 2020 14:47:01 -0400
X-MC-Unique: GXajaslgMzOt24gSl8jc8w-1
Received: from [2601:1c0:6280:3f0::19c2]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAzl5-0000E8-98; Wed, 26 Aug 2020 18:02:51 +0000
Subject: Re: [PATCH v20 22/23] LSM: Add /proc attr entry for full LSM context
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-23-casey@schaufler-ca.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2e16e5dc-d040-8e8d-0fda-eb631b4b72e1@infradead.org>
Date: Wed, 26 Aug 2020 11:02:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826145247.10029-23-casey@schaufler-ca.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 26 Aug 2020 15:01:59 -0400
Cc: john.johansen@canonical.com, linux-api@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 8/26/20 7:52 AM, Casey Schaufler wrote:
> diff --git a/Documentation/security/lsm.rst b/Documentation/security/lsm.rst
> index 6a2a2e973080..fd4c87358d54 100644
> --- a/Documentation/security/lsm.rst
> +++ b/Documentation/security/lsm.rst
> @@ -129,3 +129,31 @@ to identify it as the first security module to be registered.
>  The capabilities security module does not use the general security
>  blobs, unlike other modules. The reasons are historical and are
>  based on overhead, complexity and performance concerns.
> +
> +LSM External Interfaces
> +=======================
> +
> +The LSM infrastructure does not generally provide external interfaces.
> +The individual security modules provide what external interfaces they
> +require.
> +
> +The file ``/sys/kernel/security/lsm`` provides a comma
> +separated list of the active security modules.
> +
> +The file ``/proc/pid/attr/display`` contains the name of the security
> +module for which the ``/proc/pid/attr/current`` interface will
> +apply. This interface can be written to.
> +
> +The infrastructure does provide an interface for the special
> +case where multiple security modules provide a process context.
> +This is provided in compound context format.
> +
> +-  `lsm\0value\0lsm\0value\0`
> +
> +The `lsm` and `value` fields are nul terminated bytestrings.

Preferably                          NUL-terminated

> +Each field may contain whitespace or non-printable characters.
> +The nul bytes are included in the size of a compound context.

       NUL

> +The context ``Bell\0Secret\0Biba\0Loose\0`` has a size of 23.
> +
> +The file ``/proc/pid/attr/context`` provides the security
> +context of the identified process.


thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


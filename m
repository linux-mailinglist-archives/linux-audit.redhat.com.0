Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 04E5622FA34
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jul 2020 22:39:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-uuBbS07AMLS_DoZzeIAjxA-1; Mon, 27 Jul 2020 16:39:17 -0400
X-MC-Unique: uuBbS07AMLS_DoZzeIAjxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9867B58;
	Mon, 27 Jul 2020 20:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A7A60BF4;
	Mon, 27 Jul 2020 20:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 449AD9548F;
	Mon, 27 Jul 2020 20:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RKc4Av001114 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 16:38:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD7FBF00D0; Mon, 27 Jul 2020 20:38:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C83F00CF
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 20:37:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB4A71012444
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 20:37:59 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-434-MKTvKvHcND-Fc7NNV3CbFA-1;
	Mon, 27 Jul 2020 16:37:56 -0400
X-MC-Unique: MKTvKvHcND-Fc7NNV3CbFA-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 06RKbiR2028215;
	Mon, 27 Jul 2020 20:37:44 GMT
Date: Tue, 28 Jul 2020 06:37:44 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v19 17/23] LSM: security_secid_to_secctx in netlink
	netfilter
In-Reply-To: <20200724203226.16374-18-casey@schaufler-ca.com>
Message-ID: <alpine.LRH.2.21.2007280637160.18670@namei.org>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-18-casey@schaufler-ca.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>, selinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
	Audit-ML <linux-audit@redhat.com>, casey.schaufler@intel.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2020, Casey Schaufler wrote:

> Change netlink netfilter interfaces to use lsmcontext
> pointers, and remove scaffolding.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: netdev@vger.kernel.org

I'd like to see Paul's acks on any networking related changes.

-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 161DA2AD04A
	for <lists+linux-audit@lfdr.de>; Tue, 10 Nov 2020 08:20:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-Adyohjb9MhmA6xO0-MM-3Q-1; Tue, 10 Nov 2020 02:20:37 -0500
X-MC-Unique: Adyohjb9MhmA6xO0-MM-3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31C6457205;
	Tue, 10 Nov 2020 07:20:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C9761007637;
	Tue, 10 Nov 2020 07:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F3B2180B658;
	Tue, 10 Nov 2020 07:20:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AA7KLtY021908 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 02:20:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 677DB906BA; Tue, 10 Nov 2020 07:20:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 621E28365F
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 07:20:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09E591842082
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 07:20:19 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-532-3KML6ba6OBq-1LDNzQveLg-1;
	Tue, 10 Nov 2020 02:20:16 -0500
X-MC-Unique: 3KML6ba6OBq-1LDNzQveLg-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 0AA6rBTi009357;
	Tue, 10 Nov 2020 06:53:11 GMT
Date: Tue, 10 Nov 2020 17:53:11 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Casey Schaufler <casey@schaufler-ca.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH v22 05/23] LSM: Use lsmblob in security_secctx_to_secid
In-Reply-To: <20201105004924.11651-6-casey@schaufler-ca.com>
Message-ID: <alpine.LRH.2.21.2011101753060.9130@namei.org>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
	<20201105004924.11651-6-casey@schaufler-ca.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>, selinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, Audit-ML <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, casey.schaufler@intel.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2020, Casey Schaufler wrote:

> Change the security_secctx_to_secid interface to use a lsmblob
> structure in place of the single u32 secid in support of
> module stacking. Change its callers to do the same.
> 
> The security module hook is unchanged, still passing back a secid.
> The infrastructure passes the correct entry from the lsmblob.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org

You probably need to include Netfilter maintainers specifically for this 
(added them + the Netfilter list).

This also needs signoffs from LSM owners.

-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


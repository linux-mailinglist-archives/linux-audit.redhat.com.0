Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8942611B7
	for <lists+linux-audit@lfdr.de>; Tue,  8 Sep 2020 15:00:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-4Ylaeb88On242elfdb5zEg-1; Tue, 08 Sep 2020 09:00:55 -0400
X-MC-Unique: 4Ylaeb88On242elfdb5zEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A130D8730A0;
	Tue,  8 Sep 2020 13:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428251002D74;
	Tue,  8 Sep 2020 13:00:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAC9E1800B72;
	Tue,  8 Sep 2020 13:00:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088ArwEq001133 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 06:53:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1877100403A; Tue,  8 Sep 2020 10:53:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBCE7110F0D0
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 10:53:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C44801181
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 10:53:55 +0000 (UTC)
Received: from mail.us.es (correo.us.es [193.147.175.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-51-sV7vrgaUM2aOxAnkCI1DlA-1;
	Tue, 08 Sep 2020 06:53:53 -0400
X-MC-Unique: sV7vrgaUM2aOxAnkCI1DlA-1
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id D63A9191905
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 12:46:24 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id B82FFDA7B6
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 12:46:24 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
	id ABFFEDA73F; Tue,  8 Sep 2020 12:46:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
	SMTPAUTH_US2,URIBL_BLOCKED,USER_IN_WELCOMELIST,USER_IN_WHITELIST
	autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 7AA62DA78C;
	Tue,  8 Sep 2020 12:46:22 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
	by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int); 
	Tue, 08 Sep 2020 12:46:22 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: 1984lsi)
	by entrada.int (Postfix) with ESMTPSA id 40AB14301DE1;
	Tue,  8 Sep 2020 12:46:22 +0200 (CEST)
Date: Tue, 8 Sep 2020 12:46:21 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v20 17/23] LSM: security_secid_to_secctx in netlink
	netfilter
Message-ID: <20200908104621.GB4838@salvia>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-18-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200826145247.10029-18-casey@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 08 Sep 2020 09:00:31 -0400
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 26, 2020 at 07:52:41AM -0700, Casey Schaufler wrote:
> Change netlink netfilter interfaces to use lsmcontext
> pointers, and remove scaffolding.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: netdev@vger.kernel.org
> ---
>  net/netfilter/nfnetlink_queue.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> 
[...]
>  static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
> @@ -401,8 +399,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	enum ip_conntrack_info ctinfo;
>  	struct nfnl_ct_hook *nfnl_ct;
>  	bool csum_verify;
> -	struct lsmcontext scaff; /* scaffolding */
> -	char *secdata = NULL;
> +	struct lsmcontext context = { };
>  	u32 seclen = 0;

While at it, please introduce reverse xmas tree in variable
definitions incrementally:

	struct lsmcontext context = { };
  	enum ip_conntrack_info ctinfo;
  	struct nfnl_ct_hook *nfnl_ct;
  	bool csum_verify;
 	u32 seclen = 0;

And Cc: netfilter-devel@vger.kernel.org for patches that update the
Netfilter codebase.

Thanks.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


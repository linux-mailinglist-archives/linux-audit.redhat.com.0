Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D798425E363
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 23:38:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-yVFlzuI0M6e2Nj9Mn2RRyg-1; Fri, 04 Sep 2020 17:38:46 -0400
X-MC-Unique: yVFlzuI0M6e2Nj9Mn2RRyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63EBA802B76;
	Fri,  4 Sep 2020 21:38:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E0C37ED60;
	Fri,  4 Sep 2020 21:38:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48AC5972EB;
	Fri,  4 Sep 2020 21:38:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084LZxvA024493 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:35:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5866C10087C7; Fri,  4 Sep 2020 21:35:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C4B1009B97
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:35:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B60F811E79
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:35:56 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
	(sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-439-Cji5wIjkMdqnpN9nt8sPOQ-1;
	Fri, 04 Sep 2020 17:35:53 -0400
X-MC-Unique: Cji5wIjkMdqnpN9nt8sPOQ-1
X-YMail-OSG: 1EjBP5cVM1lbvmcFu9d_EBfAWbgG.AQm6MlzsNCjf2tdF72gAJHgBU5ImoTz_yt
	Zbg5wlYbot5o3ofQIoYiUGhk6KX_V9fGYveMGY71BaJRmntW_E56a3Uon4txUJ_z7N8Re5q_G69S
	Xd90pJ2bXS68DRDwCxMEVs3mUh7uIm0zPoKS1HMGN0LUnZgqeZowfoLdSKxdAdCE308aN.S71ayo
	AOu2nZINsOZTHWNLwzct5fqmhTGGc9RZcnMqq418BHk32zWeVrUg2PYu.72Ruy1xCDgDzyx3h1c_
	6FNZmbqw9uNyEJyHI5znAAjpFNpsT4Nm54hrAwqyMLOpldgW8DqON6woyrwpYsCe5LNtvcjoA31z
	2V2Z.v5Cp1Q70FAQHNX_P_iWIQMm05PMbEUELBsaJM_Mj4jL45qPB7EVWE7D8GC31iYmrxmxseWc
	NgA.9vjH7YfLadvk80PdZ3ABNcdKrPdbBLPzPf7x9braMcNTEsD4oDUSY5.une5JM0oK55M4vj99
	5fJx.YbsFStOKkfdemOU7PuFLT8RfFsRUIZn7vEnFkuGQhibhD.hD2.YSipKByg6GNZ.pfwUL_Mi
	0kUADno11G0hJ0vbatR6Vg8aW17lv2bJGqDwTpPgvlcoTmaA3pF4Pg2D01j8Dmz5YcJ5O_Wkt6F1
	fR9aVJrKgUICP6dTieO9trniucPdSZINvpl4yUMS3.iFHa6h3OtP0hdQAbILo7sIBsalmrY1T6Y7
	PvGYMMev0iV9qWQzadh61UO7ENZkgWbICsfcEu9loT6L1S28xwhT5C91uKJ9euyXRRmHZp20J5h8
	ha.F.LsXyeUMaWsmEx2BFQdnDE1_ohNGzzXIyTMoD_0lQr8QXuzYQTscTH62g1QxVGQjg5JEev5h
	FRlW6DGjVSONdDhdj4CEVHCIi1AyBAn.z1lOBYd8oZz3nH7QHlL4iJSMorbSWqU7oeXzA72COlHb
	G7oYWfI1GUjooqT0hrILKcriwCib77CtJgaz6JlBEUk3_eSAvJ7EUNBsI.rE6iUvBa6ueMEaSngM
	XZSFv4cx7.TVydpMC.qhseCT_6bxu0_.ErzrvoUaUFUaKWNcMEoOkWiFLxjTPbyQUkHryqnsrjI7
	Ko9ks.74Mw9prb_er6mSi5.bIyaAP8QFWpexaTs_GnLcwEbTjCKm6ejyRjLwXmv08en9yByWXoQF
	CVrdyaSjp4365wUibmtlOHdKlBZEau7KPjgtPkNicg6BNDgVccb8_47MMp5zNMksZRMoXIAFAVO0
	DVSnaw9y6..vQZCbx_zaPXOqeRBbTWWwlE6oenlBYf4bg.DiTsC1YEbvSTc8Aekh3yo6npbpSyw3
	5gJp47U6wFpqZJecQDL1xzDI2vDQhe1tDdPySqTlNXN63l5pyFXFH.ySWtuNL_SSNi0TJv8hd8Wi
	drDcNgOq7lv.pt6SXxmYhJg03AR7XUyDN3Lf6M9nlR_iFf7Krv3.q8OL.g.w3f9es0yR0C_nJXXr
	7OqaPdU6LDSCOTSP7pwzzeI2mM87e9qrSRT4RM_tZ_KTjO3SRbBgWrlPZf4ntJ8QuzsC2mpiRocK
	nNtNma0hlvm6ywgf234kj2aVfkSY-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 4 Sep 2020 21:35:53 +0000
Received: by smtp417.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 00dceb58e3f3f0bf436a9997d98cfafc; 
	Fri, 04 Sep 2020 21:35:48 +0000 (UTC)
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Paul Moore <paul@paul-moore.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
Date: Fri, 4 Sep 2020 14:35:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/4/2020 1:08 PM, Paul Moore wrote:
> On Wed, Aug 26, 2020 at 11:07 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> Change the data used in UDS SO_PEERSEC processing from a
>> secid to a more general struct lsmblob. Update the
>> security_socket_getpeersec_dgram() interface to use the
>> lsmblob. There is a small amount of scaffolding code
>> that will come out when the security_secid_to_secctx()
>> code is brought in line with the lsmblob.
>>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> ---
>>  include/linux/security.h |  7 +++++--
>>  include/net/af_unix.h    |  2 +-
>>  include/net/scm.h        |  8 +++++---
>>  net/ipv4/ip_sockglue.c   |  8 +++++---
>>  net/unix/af_unix.c       |  6 +++---
>>  security/security.c      | 18 +++++++++++++++---
>>  6 files changed, 34 insertions(+), 15 deletions(-)
> ...
>
>> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
>> index f42fdddecd41..a86da0cb5ec1 100644
>> --- a/include/net/af_unix.h
>> +++ b/include/net/af_unix.h
>> @@ -36,7 +36,7 @@ struct unix_skb_parms {
>>         kgid_t                  gid;
>>         struct scm_fp_list      *fp;            /* Passed files         */
>>  #ifdef CONFIG_SECURITY_NETWORK
>> -       u32                     secid;          /* Security ID          */
>> +       struct lsmblob          lsmblob;        /* Security LSM data    */
> As mentioned in a previous revision, I remain concerned that this is
> going to become a problem due to the size limit on unix_skb_parms.  I
> would need to redo the math to be certain, but if I recall correctly
> this would limit us to five LSMs assuming both that we don't need to
> grow the per-LSM size of lsmblob *and* the netdev folks don't decide
> to add more fields to the unix_skb_parms.
>
> I lost track of that earlier discussion so I'm not sure where it ended
> up, but if there is a viable alternative it might be a good idea to
> pursue it.

Stephen had concerns about the lifecycle management involved. He also
pointed out that I had taken a cowards way out when allocations failed.
That could result in unexpected behavior when an allocation failed.
Fixing that would have required a major re-write of the currently simple
UDS attribute code, which I suspect would be as hard a sell to netdev as
expanding the secid to a lsmblob. I also thought I'd gotten netdev on the
CC: for this patch, but it looks like I missed it.

I did start on the UDS attribute re-do, and discovered that I was going
to have to introduce new failure paths, and that it might not be possible
to maintain compatibility for all cases because of the new possibilities
of failure.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


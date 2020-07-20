Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B023E22609F
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:19:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-2uKfTHdtP_mVuWizY5ms4g-1; Mon, 20 Jul 2020 09:18:44 -0400
X-MC-Unique: 2uKfTHdtP_mVuWizY5ms4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 616C61083E86;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 432105C5FA;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13CB89A157;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HNGnhS002249 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 19:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC70D215688F; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D739E2156A53
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 841EE858EE4
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-295-IlS0pIiJNTecKrJy_frVtQ-1;
	Fri, 17 Jul 2020 19:16:42 -0400
X-MC-Unique: IlS0pIiJNTecKrJy_frVtQ-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC2CA20B4911;
	Fri, 17 Jul 2020 16:09:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC2CA20B4911
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Subject: [RFC PATCH v4 06/12] dm-verity: move signature check after tree
	validation
Date: Fri, 17 Jul 2020 16:09:35 -0700
Message-Id: <20200717230941.1190744-7-deven.desai@linux.microsoft.com>
In-Reply-To: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HNGnhS002249
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG introduced by Jaskaran was
intended to be used to allow an LSM to enforce verifications for all
dm-verity volumes.

However, with it's current implementation, this signature verification
occurs after the merkel-tree is validated, as a result the signature can
pass initial verification by passing a matching root-hash and signature.
This results in an unreadable block_device, but that has passed signature
validation (and subsequently, would be marked as verified).

This change moves the signature verification to after the merkel-tree has
finished validation.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 drivers/md/dm-verity-target.c     |  42 ++++-----
 drivers/md/dm-verity-verify-sig.c | 140 ++++++++++++++++++++++--------
 drivers/md/dm-verity-verify-sig.h |  20 ++---
 drivers/md/dm-verity.h            |   2 +-
 4 files changed, 132 insertions(+), 72 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index eec9f252e935..c507f3a4e237 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -471,9 +471,9 @@ static int verity_verify_io(struct dm_verity_io *io)
 	struct bvec_iter start;
 	unsigned b;
 	struct crypto_wait wait;
+	int r;
 
 	for (b = 0; b < io->n_blocks; b++) {
-		int r;
 		sector_t cur_block = io->block + b;
 		struct ahash_request *req = verity_io_hash_req(v, io);
 
@@ -530,6 +530,16 @@ static int verity_verify_io(struct dm_verity_io *io)
 			return -EIO;
 	}
 
+	/*
+	 * At this point, the merkel tree has finished validating.
+	 * if signature was specified, validate the signature here.
+	 */
+	r = verity_verify_root_hash(v);
+	if (r < 0) {
+		DMERR_LIMIT("signature mismatch");
+		return r;
+	}
+
 	return 0;
 }
 
@@ -728,7 +738,7 @@ static void verity_status(struct dm_target *ti, status_type_t type,
 			args++;
 		if (v->validated_blocks)
 			args++;
-		if (v->signature_key_desc)
+		if (v->sig)
 			args += DM_VERITY_ROOT_HASH_VERIFICATION_OPTS;
 		if (!args)
 			return;
@@ -751,9 +761,9 @@ static void verity_status(struct dm_target *ti, status_type_t type,
 		if (v->validated_blocks)
 			DMEMIT(" " DM_VERITY_OPT_AT_MOST_ONCE);
 		sz = verity_fec_status_table(v, sz, result, maxlen);
-		if (v->signature_key_desc)
+		if (v->sig)
 			DMEMIT(" " DM_VERITY_ROOT_HASH_VERIFICATION_OPT_SIG_KEY
-				" %s", v->signature_key_desc);
+				" %s", v->sig->signature_key_desc);
 		break;
 	}
 }
@@ -819,7 +829,7 @@ static void verity_dtr(struct dm_target *ti)
 
 	verity_fec_dtr(v);
 
-	kfree(v->signature_key_desc);
+	verity_verify_dtr(v);
 
 	kfree(v);
 }
@@ -876,8 +886,7 @@ static int verity_alloc_zero_digest(struct dm_verity *v)
 	return r;
 }
 
-static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
-				 struct dm_verity_sig_opts *verify_args)
+static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v)
 {
 	int r;
 	unsigned argc;
@@ -927,9 +936,7 @@ static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
 				return r;
 			continue;
 		} else if (verity_verify_is_sig_opt_arg(arg_name)) {
-			r = verity_verify_sig_parse_opt_args(as, v,
-							     verify_args,
-							     &argc, arg_name);
+			r = verity_verify_sig_parse_opt_args(as, v, &argc);
 			if (r)
 				return r;
 			continue;
@@ -960,7 +967,6 @@ static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
 static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 {
 	struct dm_verity *v;
-	struct dm_verity_sig_opts verify_args = {0};
 	struct dm_arg_set as;
 	unsigned int num;
 	unsigned long long num_ll;
@@ -1128,20 +1134,11 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		as.argc = argc;
 		as.argv = argv;
 
-		r = verity_parse_opt_args(&as, v, &verify_args);
+		r = verity_parse_opt_args(&as, v);
 		if (r < 0)
 			goto bad;
 	}
 
-	/* Root hash signature is  a optional parameter*/
-	r = verity_verify_root_hash(root_hash_digest_to_validate,
-				    strlen(root_hash_digest_to_validate),
-				    verify_args.sig,
-				    verify_args.sig_size);
-	if (r < 0) {
-		ti->error = "Root hash verification failed";
-		goto bad;
-	}
 	v->hash_per_block_bits =
 		__fls((1 << v->hash_dev_block_bits) / v->digest_size);
 
@@ -1207,13 +1204,10 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	ti->per_io_data_size = roundup(ti->per_io_data_size,
 				       __alignof__(struct dm_verity_io));
 
-	verity_verify_sig_opts_cleanup(&verify_args);
-
 	return 0;
 
 bad:
 
-	verity_verify_sig_opts_cleanup(&verify_args);
 	verity_dtr(ti);
 
 	return r;
diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-verify-sig.c
index 614e43db93aa..27dac8aa2e5a 100644
--- a/drivers/md/dm-verity-verify-sig.c
+++ b/drivers/md/dm-verity-verify-sig.c
@@ -22,6 +22,16 @@ MODULE_PARM_DESC(require_signatures,
 #define DM_VERITY_IS_SIG_FORCE_ENABLED() \
 	(require_signatures != false)
 
+static void destroy_verity_sig(struct dm_verity_sig *sig_info)
+{
+	if (!sig_info)
+		return;
+
+	kfree(sig_info->sig);
+	kfree(sig_info->signature_key_desc);
+	kfree(sig_info);
+}
+
 bool verity_verify_is_sig_opt_arg(const char *arg_name)
 {
 	return (!strcasecmp(arg_name,
@@ -29,7 +39,7 @@ bool verity_verify_is_sig_opt_arg(const char *arg_name)
 }
 
 static int verity_verify_get_sig_from_key(const char *key_desc,
-					struct dm_verity_sig_opts *sig_opts)
+					  struct dm_verity_sig  *sig_info)
 {
 	struct key *key;
 	const struct user_key_payload *ukp;
@@ -48,14 +58,14 @@ static int verity_verify_get_sig_from_key(const char *key_desc,
 		goto end;
 	}
 
-	sig_opts->sig = kmalloc(ukp->datalen, GFP_KERNEL);
-	if (!sig_opts->sig) {
+	sig_info->sig = kmalloc(ukp->datalen, GFP_KERNEL);
+	if (!sig_info->sig) {
 		ret = -ENOMEM;
 		goto end;
 	}
-	sig_opts->sig_size = ukp->datalen;
+	sig_info->sig_size = ukp->datalen;
 
-	memcpy(sig_opts->sig, ukp->data, sig_opts->sig_size);
+	memcpy(sig_info->sig, ukp->data, sig_info->sig_size);
 
 end:
 	up_read(&key->sem);
@@ -64,70 +74,128 @@ static int verity_verify_get_sig_from_key(const char *key_desc,
 	return ret;
 }
 
+/**
+ * Parse any signature verification arguments.
+ *	This function will populate v->sig, it is the caller's
+ *	responsibility to free this structure via verity_verify_dtr
+ *
+ * @as: argument set passed in to parse
+ * @v: verity context structure. Should have a NULL v->sig member.
+ * @argc: current argument number
+ */
 int verity_verify_sig_parse_opt_args(struct dm_arg_set *as,
 				     struct dm_verity *v,
-				     struct dm_verity_sig_opts *sig_opts,
-				     unsigned int *argc,
-				     const char *arg_name)
+				     unsigned int *argc)
 {
 	struct dm_target *ti = v->ti;
+	struct dm_verity_sig *sig_info = NULL;
 	int ret = 0;
 	const char *sig_key = NULL;
 
 	if (!*argc) {
 		ti->error = DM_VERITY_VERIFY_ERR("Signature key not specified");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	sig_info = kzalloc(sizeof(*sig_info), GFP_KERNEL);
+	if (!sig_info) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
 	sig_key = dm_shift_arg(as);
 	(*argc)--;
 
-	ret = verity_verify_get_sig_from_key(sig_key, sig_opts);
-	if (ret < 0)
+	ret = verity_verify_get_sig_from_key(sig_key, sig_info);
+	if (ret < 0) {
 		ti->error = DM_VERITY_VERIFY_ERR("Invalid key specified");
+		goto cleanup;
+	}
 
-	v->signature_key_desc = kstrdup(sig_key, GFP_KERNEL);
-	if (!v->signature_key_desc)
-		return -ENOMEM;
+	sig_info->signature_key_desc = kstrdup(sig_key, GFP_KERNEL);
+	if (!sig_info->signature_key_desc) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
 
+	v->sig = sig_info;
+	sig_info = NULL;
+cleanup:
+	if (sig_info)
+		destroy_verity_sig(sig_info);
 	return ret;
 }
 
-/*
+/**
  * verify_verify_roothash - Verify the root hash of the verity hash device
  *			     using builtin trusted keys.
  *
- * @root_hash: For verity, the roothash/data to be verified.
- * @root_hash_len: Size of the roothash/data to be verified.
- * @sig_data: The trusted signature that verifies the roothash/data.
- * @sig_len: Size of the signature.
+ * @v: dm_verity structure containing all context for the dm_verity
+ *	operation.
  *
  */
-int verity_verify_root_hash(const void *root_hash, size_t root_hash_len,
-			    const void *sig_data, size_t sig_len)
+int verity_verify_root_hash(const struct dm_verity *v)
 {
-	int ret;
+	int ret = 0;
+	char *root_hash = NULL;
+	size_t root_hash_size = 0;
+	struct dm_verity_sig *sig_target = NULL;
+
+	if (!v || !v->ti || !v->root_digest || v->digest_size == 0) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	sig_target = v->sig;
+
+	if (!sig_target || !sig_target->sig || sig_target->sig_size == 0) {
+		if (DM_VERITY_IS_SIG_FORCE_ENABLED()) {
+			ret = -ENOKEY;
+			goto cleanup;
+		} else {
+			goto cleanup;
+		}
+	}
 
-	if (!root_hash || root_hash_len == 0)
-		return -EINVAL;
+	/*
+	 * If signature has passed validation once, assume
+	 * that future signatures will pass.
+	 */
+	if (sig_target->passed)
+		goto cleanup;
 
-	if (!sig_data  || sig_len == 0) {
-		if (DM_VERITY_IS_SIG_FORCE_ENABLED())
-			return -ENOKEY;
-		else
-			return 0;
+	root_hash_size = v->digest_size * 2;
+	root_hash = kzalloc(root_hash_size, GFP_KERNEL);
+	if (!root_hash) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
-	ret = verify_pkcs7_signature(root_hash, root_hash_len, sig_data,
-				sig_len, NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
-				NULL, NULL);
+	bin2hex(root_hash, v->root_digest, v->digest_size);
+
+	ret = verify_pkcs7_signature(root_hash, root_hash_size, v->sig->sig,
+				     v->sig->sig_size, NULL,
+				     VERIFYING_UNSPECIFIED_SIGNATURE, NULL,
+				     NULL);
+	if (ret != 0)
+		goto cleanup;
 
+	sig_target->passed = true;
+cleanup:
+	kfree(root_hash);
 	return ret;
 }
 
-void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
+/**
+ * Performs destruction / cleanup of a valid dm_verity_sig struct
+ *
+ * @v: dm_verity structure containing the dm_verity_sig struct to
+ *	be freed.
+ */
+
+void verity_verify_dtr(struct dm_verity *v)
 {
-	kfree(sig_opts->sig);
-	sig_opts->sig = NULL;
-	sig_opts->sig_size = 0;
+	destroy_verity_sig(v->sig);
+	v->sig = NULL;
 }
diff --git a/drivers/md/dm-verity-verify-sig.h b/drivers/md/dm-verity-verify-sig.h
index 19b1547aa741..81158d7702a3 100644
--- a/drivers/md/dm-verity-verify-sig.h
+++ b/drivers/md/dm-verity-verify-sig.h
@@ -11,31 +11,30 @@
 #define DM_VERITY_ROOT_HASH_VERIFICATION "DM Verity Sig Verification"
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPT_SIG_KEY "root_hash_sig_key_desc"
 
-struct dm_verity_sig_opts {
+struct dm_verity_sig {
+	char *signature_key_desc;
 	unsigned int sig_size;
 	u8 *sig;
+	bool passed;
 };
 
 #ifdef CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG
 
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 2
 
-int verity_verify_root_hash(const void *data, size_t data_len,
-			    const void *sig_data, size_t sig_len);
+int verity_verify_root_hash(const struct dm_verity *v);
 bool verity_verify_is_sig_opt_arg(const char *arg_name);
 
 int verity_verify_sig_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
-				    struct dm_verity_sig_opts *sig_opts,
-				    unsigned int *argc, const char *arg_name);
+				    unsigned int *argc);
 
-void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts);
+void verity_verify_dtr(struct dm_verity *v);
 
 #else
 
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 0
 
-int verity_verify_root_hash(const void *data, size_t data_len,
-			    const void *sig_data, size_t sig_len)
+int verity_verify_root_hash(const struct dm_verity *v)
 {
 	return 0;
 }
@@ -46,13 +45,12 @@ bool verity_verify_is_sig_opt_arg(const char *arg_name)
 }
 
 int verity_verify_sig_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
-				    struct dm_verity_sig_opts *sig_opts,
-				    unsigned int *argc, const char *arg_name)
+				    unsigned int *argc)
 {
 	return -EINVAL;
 }
 
-void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
+void verity_verify_dtr(struct dm_verity *v)
 {
 }
 
diff --git a/drivers/md/dm-verity.h b/drivers/md/dm-verity.h
index 641b9e3a399b..995c495decad 100644
--- a/drivers/md/dm-verity.h
+++ b/drivers/md/dm-verity.h
@@ -64,7 +64,7 @@ struct dm_verity {
 	struct dm_verity_fec *fec;	/* forward error correction */
 	unsigned long *validated_blocks; /* bitset blocks validated */
 
-	char *signature_key_desc; /* signature keyring reference */
+	struct dm_verity_sig *sig; /* signature verification */
 };
 
 struct dm_verity_io {
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

